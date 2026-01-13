# Power Supply

!!! note "Documentation In Progress"
    This page is under construction. Check back soon!

## Requirements

| Component | Voltage | Current |
|-----------|---------|---------|
| Raspberry Pi | 5V | 3A |
| Radios (each) | 13.8V | 5-10A TX |
| NinoTNC | 5V (USB) | 100mA |

## Recommended Setup

- **Main supply**: 13.8V DC, 20-30A switching supply
- **Pi power**: USB-C 5V 3A adapter, or 12V-to-5V converter
- **Backup**: Optional 12V battery for Pi continuity

## Fusing

- Fuse each radio individually
- Main supply fuse at distribution point
- See [Fuse Holder STL](enclosure/stl/README.md)

## Resources

- [TARPN Power Guide](https://tarpn.net/t/builder/builders_power.html)
