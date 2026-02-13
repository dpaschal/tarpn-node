> **Important:** This isn't the documentation or code that Tadd KA2DEW supervises. That code is at https://tarpn.net/
> Technical support is available for the tarpn.net code and documentation at [tarpn@groups.io](https://groups.io/g/tarpn).

# TARPN Node

<p align="center">
  <a href="https://buymeacoffee.com/dpaschal">
    <img src="https://img.shields.io/badge/❤️🎆_THANKS!_🎆❤️-Support_This_Project-ff0000?style=for-the-badge" alt="Thanks!" height="40">
  </a>
</p>

<p align="center">
  <b>☕ Buy me Claude Code credits or support a project! ☕</b>
</p>
<p align="center">
  <i>Every donation keeps the code flowing — these tools are built with your support.</i>
</p>

<p align="center">
  <a href="https://buymeacoffee.com/dpaschal">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" height="50">
  </a>
</p>

---

A modern, centralized repository for building TARPN (Terrestrial Amateur Radio Packet Network) nodes.

[![Documentation](https://img.shields.io/badge/docs-mkdocs-blue)](https://dpaschal.github.io/tarpn-node)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

> **Note:** Documentation is actively being developed. Core scripts and STL files are ready for use. Some documentation pages contain placeholder content marked "Documentation In Progress".

## What is TARPN?

TARPN is an off-grid amateur radio social network that operates entirely over ham radio infrastructure - no internet required. It enables multi-state email, live chat, and social interaction using dedicated point-to-point VHF/UHF radio links.

**Key Features:**
- 100% ham operator controlled infrastructure
- Grid-independent (survives internet/cellular outages)
- Low cost (~$500-650 for complete dual-port node)
- Educational (teaches networking, radio, and digital communications)

## Quick Start

### Hardware Required

| Component | Qty | Est. Cost |
|-----------|-----|-----------|
| Raspberry Pi 4B (1GB+) | 1 | $45 |
| 16GB micro SD (Class 10) | 1 | $8 |
| NinoTNC N9600A | 2 | $80-140 |
| VHF/UHF Radio (surplus) | 2 | $100 |
| 13.8V Power Supply | 1 | $50-100 |
| Antennas | 2 | $140 |
| 3D Printed Enclosure | 1 | $20 |

See [hardware/bom/](hardware/bom/) for complete bill of materials with links.

### Software Installation

```bash
# Download and run the installer
curl -sSL https://raw.githubusercontent.com/dpaschal/tarpn-node/main/scripts/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/dpaschal/tarpn-node.git
cd tarpn-node
./scripts/install.sh
```

### 3D Printed Enclosure

STL files for the single-wide nodebox are in [hardware/enclosure/stl/](hardware/enclosure/stl/).

**Print Settings:**
- Material: PLA or PETG
- Layer Height: 0.2mm
- Infill: 20-30%
- Supports: As needed per part

See [docs/hardware/enclosure/](docs/hardware/enclosure/) for assembly instructions.

## Documentation

Full documentation available at: **https://dpaschal.github.io/tarpn-node**

- [Hardware Build Guide](docs/hardware/)
- [Software Installation](docs/software/installation.md)
- [Configuration Guide](docs/software/configuration.md)
- [Network Setup](docs/network/)
- [Troubleshooting](docs/software/troubleshooting.md)

## Repository Structure

```
tarpn-node/
├── docs/               # MkDocs documentation
├── hardware/
│   ├── enclosure/stl/  # 3D print files
│   ├── wiring/         # Wiring diagrams
│   └── bom/            # Bill of materials
├── scripts/            # Installation and management scripts
├── config/             # Configuration templates
├── image/              # SD card image build system
└── tests/              # Automated tests
```

## TARPN Commands

After installation, use the `tarpn` command:

```bash
tarpn                  # Show status
tarpn config           # Configure node
tarpn service start    # Start background service
tarpn home start       # Start web interface
tarpn update           # Update TARPN software
tarpn backup           # Backup configuration
tarpn test             # Test node operation
```

## Community

- **NCPACKET (NC Area):** [ncpacket@groups.io](https://groups.io/g/ncpacket)
- **TARPN Technical:** [tarpn@groups.io](https://groups.io/g/tarpn)
- **Issues:** [GitHub Issues](https://github.com/dpaschal/tarpn-node/issues)

## Credits

- **TARPN Project:** Tadd Torborg (KA2DEW) - [tarpn.net](https://tarpn.net)
- **LinBPQ:** John Wiseman (G8BPQ) - [g8bpq/LinBPQ](https://github.com/g8bpq/LinBPQ)
- **NinoTNC:** Nino Carrillo (KK4HEJ)
- **Enclosure Design:** TARPN Community

## License

MIT License - See [LICENSE](LICENSE) for details.

---

*This repository modernizes and centralizes the TARPN node build process, previously scattered across multiple websites and scripts.*
