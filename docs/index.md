# TARPN Node Documentation

Welcome to the TARPN Node documentation. This guide will help you build and configure a complete TARPN (Terrestrial Amateur Radio Packet Network) node.

## What is TARPN?

TARPN is an **off-grid amateur radio social network** that operates entirely over ham radio infrastructure. No internet required - by design.

**Key Features:**

- Multi-state email, chat, and social interaction
- Dedicated point-to-point VHF/UHF radio links
- 100% ham operator controlled
- Grid-independent (survives internet/cellular outages)
- Low cost barrier (~$500-650 for complete node)

## Quick Start

### 1. Gather Hardware

You'll need:

- Raspberry Pi 4B (1GB+ RAM)
- 2x NinoTNC N9600A
- 2x VHF/UHF radios (surplus commercial recommended)
- Power supply, antennas, cables
- 3D printed or wooden enclosure

See the [Shopping List](hardware/shopping-list.md) for complete details.

### 2. Build the Enclosure

Download and print the STL files from `hardware/enclosure/stl/`, or build a traditional wooden cabinet.

See the [Enclosure Guide](hardware/enclosure/overview.md) for assembly instructions.

### 3. Install Software

```bash
# On your Raspberry Pi
curl -sSL https://raw.githubusercontent.com/dpaschal/tarpn-node/main/scripts/install.sh | bash
```

See [Installation Guide](software/installation.md) for detailed steps.

### 4. Configure Your Node

```bash
tarpn config
```

See [Configuration Guide](software/configuration.md) for all options.

### 5. Join the Network

Coordinate with your local TARPN group to link your node to neighbors.

See [Network Linking](network/linking.md) for details.

## Documentation Sections

| Section | Description |
|---------|-------------|
| [Hardware](hardware/overview.md) | Component selection, wiring, enclosure build |
| [Software](software/installation.md) | Installation, configuration, commands |
| [Network](network/architecture.md) | How TARPN works, frequencies, linking |
| [Advanced](advanced/building-from-source.md) | Building from source, custom images |

## Community

- **NCPACKET (NC Area):** [ncpacket@groups.io](https://groups.io/g/ncpacket)
- **TARPN Technical:** [tarpn@groups.io](https://groups.io/g/tarpn)
- **GitHub Issues:** [Report bugs or request features](https://github.com/dpaschal/tarpn-node/issues)

## Credits

- **TARPN Project:** Tadd Torborg (KA2DEW)
- **LinBPQ:** John Wiseman (G8BPQ)
- **NinoTNC:** Nino Carrillo (KK4HEJ)
