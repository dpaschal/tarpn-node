#!/bin/bash
#
# TARPN Node Installation Script
# https://github.com/dpaschal/tarpn-node
#
# Usage: curl -sSL https://raw.githubusercontent.com/dpaschal/tarpn-node/main/scripts/install.sh | bash
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TARPN_VERSION="1.0.0"
TARPN_REPO="https://github.com/dpaschal/tarpn-node"
TARPN_DIR="/opt/tarpn"
TARPN_USER="pi"
LOG_FILE="/var/log/tarpn-install.log"

# Logging
log() {
    echo -e "${GREEN}[TARPN]${NC} $1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE" 2>/dev/null || true
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] WARN: $1" >> "$LOG_FILE" 2>/dev/null || true
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" >> "$LOG_FILE" 2>/dev/null || true
    exit 1
}

# Header
print_header() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}        TARPN Node Installation Script v${TARPN_VERSION}              ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}        Terrestrial Amateur Radio Packet Network          ${BLUE}║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Check if running on Raspberry Pi
check_platform() {
    log "Checking platform..."

    if [[ ! -f /proc/cpuinfo ]]; then
        error "Cannot detect platform. Is this a Raspberry Pi?"
    fi

    if ! grep -q "Raspberry Pi\|BCM" /proc/cpuinfo 2>/dev/null; then
        warn "This doesn't appear to be a Raspberry Pi. Continuing anyway..."
    fi

    # Check architecture
    ARCH=$(uname -m)
    log "Architecture: $ARCH"

    if [[ "$ARCH" == "aarch64" ]]; then
        log "64-bit ARM detected"
    elif [[ "$ARCH" == "armv7l" ]]; then
        log "32-bit ARM detected"
    else
        warn "Unexpected architecture: $ARCH"
    fi
}

# Check if running as correct user
check_user() {
    log "Checking user..."

    if [[ "$EUID" -eq 0 ]]; then
        error "Do not run this script as root. Run as user '$TARPN_USER' instead."
    fi

    if [[ "$USER" != "$TARPN_USER" ]]; then
        warn "Running as '$USER' instead of '$TARPN_USER'. Some features may not work."
    fi
}

# Check OS version
check_os() {
    log "Checking operating system..."

    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        log "OS: $PRETTY_NAME"

        if [[ "$VERSION_CODENAME" != "bookworm" && "$VERSION_CODENAME" != "bullseye" ]]; then
            warn "This script is tested on Debian Bullseye/Bookworm. You have: $VERSION_CODENAME"
        fi
    else
        warn "Cannot detect OS version"
    fi
}

# Check network connectivity
check_network() {
    log "Checking network connectivity..."

    if ! ping -c 1 github.com &>/dev/null; then
        error "Cannot reach github.com. Check your network connection."
    fi

    log "Network OK"
}

# Install system dependencies
install_dependencies() {
    log "Installing system dependencies..."

    sudo apt-get update
    sudo apt-get dist-upgrade -y

    # Core dependencies (from original TARPN scripts)
    sudo apt-get install -y \
        git \
        build-essential \
        libpcap0.8 \
        libpcap-dev \
        libasound2-dev \
        zlib1g \
        libminiupnpc-dev \
        libconfig-dev \
        libcap2-bin \
        screen \
        jq \
        curl \
        wget \
        zip \
        unzip

    # Communication and system tools
    sudo apt-get install -y \
        ftp \
        telnet \
        vim \
        minicom \
        xinetd \
        iputils-ping \
        htop \
        tree \
        rsync

    # Python dependencies for TARPN tools
    sudo apt-get install -y \
        python3-pip \
        python3-serial

    # Install Python packages
    pip3 install --user \
        tornado \
        pyserial \
        telnetlib3 \
        configparser || true

    log "Dependencies installed"
}

# Clone TARPN repository
clone_repo() {
    log "Cloning TARPN repository..."

    if [[ -d "$TARPN_DIR" ]]; then
        warn "TARPN directory exists. Updating..."
        cd "$TARPN_DIR"
        sudo git pull
    else
        sudo git clone "$TARPN_REPO" "$TARPN_DIR"
        sudo chown -R "$TARPN_USER:$TARPN_USER" "$TARPN_DIR"
    fi

    log "Repository cloned to $TARPN_DIR"
}

# Download and build LinBPQ
install_linbpq() {
    log "Installing LinBPQ..."

    LINBPQ_DIR="$TARPN_DIR/linbpq"
    mkdir -p "$LINBPQ_DIR"
    cd "$LINBPQ_DIR"

    # Download latest LinBPQ binary
    LINBPQ_URL="https://www.cantab.net/users/john.wiseman/Downloads/Beta/pilinbpq"

    log "Downloading LinBPQ from $LINBPQ_URL..."
    wget -q "$LINBPQ_URL" -O linbpq
    chmod +x linbpq

    # Set capabilities for network operations
    sudo setcap cap_net_admin,cap_net_raw,cap_net_bind_service=ep linbpq

    log "LinBPQ installed"
}

# Configure serial port settings
configure_serial() {
    log "Configuring serial port settings..."

    # Enable UART in boot config
    if [[ -f /boot/config.txt ]]; then
        if ! grep -q "^enable_uart=1" /boot/config.txt; then
            echo "enable_uart=1" | sudo tee -a /boot/config.txt
        fi
    fi

    # Disable serial console (frees up UART for TNC use)
    if [[ -f /boot/cmdline.txt ]]; then
        sudo sed -i 's/console=serial0,[0-9]* //g' /boot/cmdline.txt
        sudo sed -i 's/console=ttyAMA0,[0-9]* //g' /boot/cmdline.txt
    fi

    # Stop serial-getty service
    sudo systemctl stop serial-getty@ttyAMA0.service 2>/dev/null || true
    sudo systemctl disable serial-getty@ttyAMA0.service 2>/dev/null || true

    # Enable i2c module (for some TNC boards)
    if ! grep -q "^i2c-dev" /etc/modules 2>/dev/null; then
        echo "i2c-dev" | sudo tee -a /etc/modules
    fi

    log "Serial port configured"
}

# Create log files
setup_logging() {
    log "Setting up log files..."

    LOG_DIR="/var/log"
    LOG_FILES=(
        "tarpn_service.log"
        "tarpn_command.log"
        "tarpn_home.log"
        "tarpn_mon.log"
        "tarpn_runtime.log"
        "tarpn_ninotnc.log"
    )

    for lf in "${LOG_FILES[@]}"; do
        sudo touch "$LOG_DIR/$lf"
        sudo chmod 666 "$LOG_DIR/$lf"
    done

    log "Log files created"
}

# Setup NinoTNC firmware directory
setup_ninotnc() {
    log "Setting up NinoTNC firmware directory..."

    NINOTNC_DIR="/usr/local/etc/ninotnc/versions"
    sudo mkdir -p "$NINOTNC_DIR"

    # Create placeholder for firmware versions
    echo "# NinoTNC firmware versions will be downloaded here" | sudo tee "$NINOTNC_DIR/README.txt"

    log "NinoTNC directory created"
}

# Create configuration from templates
create_config() {
    log "Creating configuration files..."

    CONFIG_DIR="$TARPN_DIR/config"
    LINBPQ_DIR="$TARPN_DIR/linbpq"

    # Create linbpq directory
    mkdir -p "$LINBPQ_DIR"

    # Copy template if no config exists
    if [[ ! -f "$LINBPQ_DIR/bpq32.cfg" ]]; then
        cp "$CONFIG_DIR/examples/dual-port.cfg" "$LINBPQ_DIR/bpq32.cfg"
        log "Created default bpq32.cfg - run 'tarpn config' to customize"
    fi

    # Copy chat config if it exists
    if [[ -f "$CONFIG_DIR/examples/chatconfig.cfg" ]] && [[ ! -f "$LINBPQ_DIR/chatconfig.cfg" ]]; then
        cp "$CONFIG_DIR/examples/chatconfig.cfg" "$LINBPQ_DIR/chatconfig.cfg"
    fi

    # Create node.ini template
    if [[ ! -f "$LINBPQ_DIR/node.ini" ]]; then
        cat > "$LINBPQ_DIR/node.ini" << 'NODEINI'
[node]
# Your callsign (required)
mycall = N0CALL

# Your grid locator
locator = XX00

# Node description
description = TARPN Node

[port1]
# Port 1 configuration
enabled = false
device = /dev/ttyUSB0
speed = 9600
neighbor =

[port2]
# Port 2 configuration
enabled = false
device = /dev/ttyUSB1
speed = 9600
neighbor =
NODEINI
        log "Created default node.ini - run 'tarpn config' to customize"
    fi

    log "Configuration files created"
}

# Install tarpn command
install_tarpn_command() {
    log "Installing tarpn command..."

    sudo ln -sf "$TARPN_DIR/scripts/tarpn" /usr/local/bin/tarpn
    sudo chmod +x "$TARPN_DIR/scripts/tarpn"

    log "tarpn command installed"
}

# Create systemd service
create_service() {
    log "Creating systemd service..."

    sudo tee /etc/systemd/system/tarpn.service > /dev/null << EOF
[Unit]
Description=TARPN Node (LinBPQ)
After=network.target

[Service]
Type=forking
WorkingDirectory=$TARPN_DIR/linbpq
User=$TARPN_USER
Group=$TARPN_USER
ExecStart=/usr/bin/screen -S tarpn -d -m $TARPN_DIR/linbpq/linbpq
ExecStop=/usr/bin/screen -S tarpn -X quit
Restart=always
RestartSec=30

[Install]
WantedBy=multi-user.target
EOF

    sudo systemctl daemon-reload

    log "Systemd service created (not enabled - run 'tarpn service start' when ready)"
}

# Print completion message
print_complete() {
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}              Installation Complete!                        ${GREEN}║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Next steps:"
    echo ""
    echo "  1. Configure your node:"
    echo "     ${BLUE}tarpn config${NC}"
    echo ""
    echo "  2. Test your node (interactive):"
    echo "     ${BLUE}tarpn test${NC}"
    echo ""
    echo "  3. Start the background service:"
    echo "     ${BLUE}tarpn service start${NC}"
    echo ""
    echo "  4. Access web interface:"
    echo "     ${BLUE}http://$(hostname -I | awk '{print $1}'):8080${NC}"
    echo ""
    echo "Documentation: https://dpaschal.github.io/tarpn-node"
    echo ""
}

# Main installation flow
main() {
    print_header

    check_platform
    check_user
    check_os
    check_network

    log "Starting installation..."

    install_dependencies
    clone_repo
    install_linbpq
    configure_serial
    setup_logging
    setup_ninotnc
    create_config
    install_tarpn_command
    create_service

    print_complete

    log "Installation complete. A reboot is recommended."
    echo ""
    read -p "Reboot now? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo reboot
    fi
}

# Run main function
main "$@"
