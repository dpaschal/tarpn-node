# TARPN Command Reference

The `tarpn` command provides management functions for your TARPN node.

## Status Commands

### `tarpn`

Show current node status (default when no command given).

```bash
$ tarpn
TARPN Node Status
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BPQ Node: RUNNING
  PID: 1234
  Uptime: 2:15:30

Network:
  IP Address: 192.168.1.100
  Web Interface: http://192.168.1.100:8080

USB Devices:
  /dev/ttyUSB0
  /dev/ttyUSB1
```

### `tarpn info`

Display detailed system information.

```bash
tarpn info
```

Shows CPU, memory, disk, and temperature information.

## Service Management

### `tarpn service start`

Start the TARPN node as a background service.

```bash
tarpn service start
```

### `tarpn service stop`

Stop the background service.

```bash
tarpn service stop
```

### `tarpn service restart`

Restart the service (useful after configuration changes).

```bash
tarpn service restart
```

### `tarpn service status`

Show systemd service status.

```bash
tarpn service status
```

## Configuration

### `tarpn config`

Launch interactive configuration wizard.

```bash
tarpn config
```

!!! warning
    Stop the node before running config: `tarpn service stop`

### `tarpn test`

Run node interactively for testing. Output goes to terminal.

```bash
tarpn test
```

Press `Ctrl+C` to stop.

## Maintenance

### `tarpn update`

Update TARPN software from GitHub.

```bash
tarpn update
```

!!! note
    Restart the service after updating: `tarpn service restart`

### `tarpn backup`

Create a backup of node configuration.

```bash
tarpn backup
```

Backups are saved to `/opt/tarpn/backups/`.

### `tarpn restore`

Restore configuration from a backup.

```bash
tarpn restore
```

## Monitoring

### `tarpn log`

View live node logs.

```bash
tarpn log
```

Press `Ctrl+C` to stop watching.

### `tarpn shell`

Open a telnet session to the BPQ command interface.

```bash
tarpn shell
```

### `tarpn listen <port>`

Monitor packets on a specific port.

```bash
tarpn listen 1
```

### `tarpn linktest <port>`

Test link quality by sending test packets.

```bash
tarpn linktest 1
```

## System

### `tarpn shutdown`

Safely shutdown the node and Raspberry Pi.

```bash
tarpn shutdown
```

!!! warning
    This will power off the Pi. You'll need physical access to restart.

### `tarpn reboot`

Safely reboot the node.

```bash
tarpn reboot
```

## Examples

### Starting Fresh

```bash
# Stop any running instance
tarpn service stop

# Configure the node
tarpn config

# Test interactively
tarpn test

# If test looks good, start as service
tarpn service start
```

### Daily Operations

```bash
# Check status
tarpn

# View logs if something seems wrong
tarpn log

# Update software
tarpn update
tarpn service restart
```

### Before Maintenance

```bash
# Backup configuration
tarpn backup

# Safely shutdown
tarpn shutdown
```
