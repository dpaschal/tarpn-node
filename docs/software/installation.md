# Software Installation

This guide covers installing the TARPN node software on your Raspberry Pi.

## Prerequisites

- Raspberry Pi 4B, 3B+, or 3B with Raspberry Pi OS installed
- Internet connection (Ethernet recommended for initial setup)
- SSH access or keyboard/monitor connected

## Quick Install

The fastest way to install:

```bash
curl -sSL https://raw.githubusercontent.com/dpaschal/tarpn-node/main/scripts/install.sh | bash
```

This will:

1. Install required system packages
2. Download LinBPQ and TARPN tools
3. Create default configuration
4. Set up systemd service

## Manual Installation

### Step 1: Update System

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Dependencies

```bash
sudo apt install -y \
    git build-essential libpcap0.8-dev libasound2-dev \
    zlib1g libminiupnpc-dev libconfig-dev screen jq curl wget
```

### Step 3: Clone Repository

```bash
sudo git clone https://github.com/dpaschal/tarpn-node /opt/tarpn
sudo chown -R $USER:$USER /opt/tarpn
```

### Step 4: Download LinBPQ

```bash
cd /opt/tarpn/linbpq
wget https://www.cantab.net/users/john.wiseman/Downloads/Beta/pilinbpq -O linbpq
chmod +x linbpq
sudo setcap cap_net_admin,cap_net_raw,cap_net_bind_service=ep linbpq
```

### Step 5: Install tarpn Command

```bash
sudo ln -sf /opt/tarpn/scripts/tarpn /usr/local/bin/tarpn
sudo chmod +x /opt/tarpn/scripts/tarpn
```

### Step 6: Create Configuration

```bash
cp /opt/tarpn/config/examples/dual-port.cfg /opt/tarpn/linbpq/bpq32.cfg
```

## Post-Installation

### Configure Your Node

Run the interactive configuration:

```bash
tarpn config
```

You'll be prompted for:

- Your callsign
- Node callsign (e.g., YOURCALL-2)
- Node name (6 characters)
- Grid locator

### Test the Node

Run in interactive mode to verify everything works:

```bash
tarpn test
```

Press `Ctrl+C` to stop.

### Start Background Service

Once testing is successful:

```bash
tarpn service start
```

### Access Web Interface

Open a browser to:

```
http://<pi-ip-address>:8080
```

## Updating

To update TARPN software:

```bash
tarpn update
tarpn service restart
```

## Troubleshooting

### Node Won't Start

1. Check logs: `tarpn log`
2. Verify USB devices: `ls /dev/ttyUSB*`
3. Check config syntax: Look for errors in `bpq32.cfg`

### No USB Devices

1. Verify NinoTNC is connected and powered
2. Check `dmesg | tail -20` for USB errors
3. Try different USB port

### Permission Errors

```bash
sudo setcap cap_net_admin,cap_net_raw,cap_net_bind_service=ep /opt/tarpn/linbpq/linbpq
```

## Next Steps

- [Configuration Guide](configuration.md) - Detailed configuration options
- [Command Reference](commands.md) - All tarpn commands
- [BPQ Configuration](bpq-config.md) - Deep dive into bpq32.cfg
