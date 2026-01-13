# 3D Printed Enclosure Build

The official TARPN nodebox enclosure designed by Tadd Torborg (KA2DEW).

## Overview

A modular, snap-fit enclosure that houses:

- Raspberry Pi
- 4x NinoTNC
- 4x VHF/UHF radios
- Power supply and distribution
- Control panel with LEDs and switches

## Print Requirements

| Specification | Value |
|---------------|-------|
| Total Parts | ~97 |
| Print Time | ~58 hours |
| Material | PLA or PETG |
| Layer Height | 0.2mm |
| Infill | 20-30% |

## STL Files

All STL files are included in this repository:

**[View STL File List & Print Quantities](stl/README.md)**

### Key Components

| Category | Parts |
|----------|-------|
| Structural (corners, beams) | 36 |
| Panels | 16 |
| Roof | 12 |
| NinoTNC mounts | 12 |
| Power/Control | 5 |
| I/O cutouts | 12 |
| Radio mounts | 4 |

## Hardware Required

From [McMaster-Carr](../../hardware/bom/mcmaster-carr.md):

- M3 x 10mm socket head screws (~200)
- M3 thin-profile square nuts (~60 per enclosure)
- M3 x 35mm screws (4)
- M3 x 65mm screws (for corner towers)
- M2.5 screws and nuts (for TNC mounting)

**Total hardware cost:** ~$130

## Print Settings

### Structural Parts (corners, beams)

```
Infill: 30%
Walls: 3 perimeters
Material: PLA or PETG
```

### Panels

```
Infill: 20%
Walls: 3 perimeters
Material: PLA
```

### Radio Mounts

```
Infill: 30%
Material: PETG (heat resistance)
```

## Assembly

See the **[Assembly Guide](assembly.md)** for step-by-step instructions.

## Tips

- Print corners and beams together using the `.3mf` file
- Use the nut placer tool for inserting square nuts
- Don't fully tighten screws until all parts are positioned
- PETG recommended for parts near radios (heat)

## Credits

Enclosure designed by **Tadd Torborg (KA2DEW)** for the TARPN project.
