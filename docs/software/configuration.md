# Configuration Guide

!!! note "Documentation In Progress"
    This page is under construction. Check back soon!

## Quick Start

Run the interactive configuration wizard:

```bash
tarpn config
```

## Configuration Files

| File | Purpose |
|------|---------|
| `bpq32.cfg` | Main LinBPQ configuration |
| `node.ini` | Node identity and neighbors |
| `chatconfig.cfg` | Chat server settings |

## Key Settings

### Node Identity

- **NODECALL** - Your node callsign (e.g., N0CALL-2)
- **NODEALIAS** - Short name (6 chars max)
- **LOCATOR** - Grid square

### Port Configuration

Each radio port needs:

- Device path (`/dev/ttyUSB0`)
- Baud rate (1200, 9600, etc.)
- Neighbor callsign

## Resources

- [BPQ Configuration Reference](bpq-config.md)
- [Command Reference](commands.md)
