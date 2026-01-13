# Raspberry Pi Setup

!!! note "Documentation In Progress"
    This page is under construction. Check back soon!

## Recommended Models

| Model | RAM | Status |
|-------|-----|--------|
| Pi 4B | 2GB+ | Recommended |
| Pi 3B+ | 1GB | Supported |
| Pi Zero 2 W | 512MB | Supported (limited) |

## OS Requirements

- Raspberry Pi OS (Bullseye or Bookworm)
- 32-bit or 64-bit supported

## Initial Setup

1. Flash Raspberry Pi OS to SD card
2. Enable SSH
3. Boot and connect to network
4. Run TARPN installer:

```bash
curl -sSL https://raw.githubusercontent.com/dpaschal/tarpn-node/main/scripts/install.sh | bash
```

## Resources

- [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
- [TARPN Installation Guide](../software/installation.md)
