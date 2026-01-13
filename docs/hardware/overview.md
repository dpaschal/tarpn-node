# Hardware Overview

A TARPN node consists of several key components working together to provide packet radio connectivity.

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    TARPN Node                           │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌──────────┐    ┌──────────┐    ┌──────────────────┐  │
│  │ Antenna  │◄──►│  Radio   │◄──►│    NinoTNC       │  │
│  │  (VHF)   │    │   #1     │    │      #1          │  │
│  └──────────┘    └──────────┘    └────────┬─────────┘  │
│                                           │ USB        │
│  ┌──────────┐    ┌──────────┐    ┌───────▼──────────┐  │
│  │ Antenna  │◄──►│  Radio   │◄──►│    NinoTNC       │  │
│  │  (UHF)   │    │   #2     │    │      #2          │  │
│  └──────────┘    └──────────┘    └────────┬─────────┘  │
│                                           │ USB        │
│  ┌────────────────────────────────────────▼─────────┐  │
│  │              Raspberry Pi                         │  │
│  │  ┌─────────────────────────────────────────────┐ │  │
│  │  │           LinBPQ (G8BPQ Node)               │ │  │
│  │  │  • Packet Routing     • Web Interface       │ │  │
│  │  │  • BBS Mail System    • Chat Server         │ │  │
│  │  └─────────────────────────────────────────────┘ │  │
│  └──────────────────────────────────────────────────┘  │
│                                                         │
│  ┌──────────────────────────────────────────────────┐  │
│  │              13.8V Power Supply                   │  │
│  └──────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

## Components

### Raspberry Pi

The brain of the node. Runs LinBPQ software for packet switching.

- **Recommended:** Raspberry Pi 4B (1GB+ RAM)
- **Also supported:** Pi 3B, 3B+, Zero 2W
- **OS:** Raspberry Pi OS (Bullseye or Bookworm)

### NinoTNC

Terminal Node Controller - converts digital data to/from radio signals.

- **Model:** N9600A (current version)
- **Interface:** USB (appears as /dev/ttyUSB*)
- **Protocols:** AX.25, IL2P (with FEC)
- **Speeds:** 300 - 19200 baud

### Radios

VHF/UHF FM transceivers for the RF links.

- **Recommended:** Surplus commercial land-mobile radios
- **Power:** 25-50W typical
- **Bands:** 2m (144 MHz), 70cm (440 MHz), 6m (50 MHz)

### Power Supply

- **Main:** 13.8V DC supply for radios (20A+ recommended)
- **Pi:** USB-C 5.1V 3A (can use 12V-5V converter)
- **Backup:** Optional GelCel battery for Pi

### Enclosure

Houses all components in a single portable unit.

- **3D Printed:** STL files provided
- **Wooden:** Traditional cabinet build
- **Commercial:** Various rack-mount options

## Typical Configurations

### Single Port (Starter)

- 1x Raspberry Pi
- 1x NinoTNC
- 1x Radio
- 1x Antenna

**Cost:** ~$200-300

### Dual Port (Standard)

- 1x Raspberry Pi
- 2x NinoTNC
- 2x Radio
- 2x Antenna

**Cost:** ~$500-650

### Multi-Port (Advanced)

- 1x Raspberry Pi
- 3-4x NinoTNC
- 3-4x Radio
- Multiple antennas

**Cost:** ~$800+

## Next Steps

1. [Shopping List](shopping-list.md) - Complete parts list with links
2. [Raspberry Pi Setup](raspberry-pi.md) - Choosing and preparing the Pi
3. [NinoTNC](ninotnc.md) - TNC assembly and configuration
4. [Radios](radios.md) - Radio selection and wiring
