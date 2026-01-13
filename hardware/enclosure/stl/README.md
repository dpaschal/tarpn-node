# Single-Wide Nodebox STL Files

3D printable enclosure for a TARPN node with dual radios and dual NinoTNCs.

**Design:** Tadd Torborg (KA2DEW)
**Version:** 2025-09-13

## Print Quantities

Based on the official assembly instructions, print the following quantities:

### Structural Components

| Qty | File | Description |
|-----|------|-------------|
| 16 | `beam-2025apr25-1.stl` | Horizontal beams |
| 16 | `corner-tower-T2025may01-1.stl` | Corner posts |
| 4 | `foot-jul15-1.stl` | Rubber foot mounts |

### Bottom Panels

| Qty | File | Description |
|-----|------|-------------|
| 4 | `bottom-panel-stephen-2024sep05-1.stl` | Bottom panels |
| 4 | `bottom-panel-key.stl` | Bottom panel locks |

### Side Panels

| Qty | File | Description |
|-----|------|-------------|
| 11 | `side-panel-jul09-1.stl` | Side panels |
| 1 | `right-half-with-vent-holes-25feb25-7.stl` | Vented right panel |
| 1 | `hinged-200mm-panel-2025may23-1.stl` | Hinged access panel |

### Roof Components

| Qty | File | Description |
|-----|------|-------------|
| 4 | `roof-corner-25jan03-1.stl` | Roof corner pieces |
| 4 | `roof-edge-beam-25jan04-2.stl` | Roof edge beams |
| 4 | `roof-quadrant-25jan05-1.stl` | Roof quadrant panels |

### NinoTNC Mounting

| Qty | File | Description |
|-----|------|-------------|
| 4 | `ninotnc-panel-jul15-2.stl` | TNC front panel |
| 4 | `ninotnc-tray-handle-2025apr28-2.stl` | TNC tray handle |
| 4 | `ninotnc-vertical-a4-tray-2025apr30-1.stl` | Vertical TNC tray |

### Power & Control

| Qty | File | Description |
|-----|------|-------------|
| 1 | `control-panel-25may27-2.stl` | Main control panel |
| 1 | `power-supply-panel-25feb01-1.stl` | Power supply panel |
| 1 | `power-supply-support-2025mar21-3.stl` | Power supply bracket |
| 1 | `fuse-holder-2025apr12-2.stl` | Fuse holder mount |
| 1 | `battery-jan02-1.stl` | Battery holder |

### I/O Cutouts

| Qty | File | Description |
|-----|------|-------------|
| 1 | `ethernet-socket-july30-1.stl` | Ethernet port cutout |
| 1 | `hdmi-and-usb-big-socket-hole-2025apr03-1.stl` | HDMI/USB cutout |
| 4 | `coax-hole-53mm-25jan02-1.stl` | Coax feedthrough (53mm) |
| 6 | `vented-53mm-jul16-1.stl` | Vented 53mm hole |

### Radio Mounts (Choose Based on Your Radios)

| Qty | File | Description |
|-----|------|-------------|
| 4 | `tait-radio-25jan03-1.stl` | Tait radio mount |
| as needed | `vertex_Mount_20250421-1.stl` | Vertex radio mount |
| as needed | `yeasu-ftm3100r-2025apr12-1.stl` | Yaesu FTM-3100R mount |

### Tools

| Qty | File | Description |
|-----|------|-------------|
| 1 | `nut-placer-in-beam-2025mar16-1.stl` | Tool for inserting nuts into beams |

### Multi-Part Files

| File | Description |
|------|-------------|
| `corners_and_beams.3mf` | Combined print of corners and beams |

## Print Settings

**Recommended:**

| Setting | Value |
|---------|-------|
| Material | PLA or PETG |
| Layer Height | 0.2mm |
| Infill | 20-30% |
| Walls | 3 perimeters |
| Top/Bottom | 4 layers |

**Per-Part Notes:**

- **Structural parts** (corners, beams): 30% infill for strength
- **Panels**: 20% infill is sufficient
- **Radio mounts**: PETG preferred for heat resistance near radios

## Hardware Required

- M3 x 10mm screws (qty: ~50)
- M3 x 35mm screws (qty: 4)
- M3 square nuts (qty: ~60)
- 2.5mm hex driver

## Total Print Summary

| Category | Part Count | Est. Print Time |
|----------|------------|-----------------|
| Structural | 36 parts | ~20 hours |
| Panels | 16 parts | ~15 hours |
| Roof | 12 parts | ~8 hours |
| NinoTNC | 12 parts | ~6 hours |
| Power/Control | 5 parts | ~4 hours |
| I/O | 12 parts | ~3 hours |
| Radio Mounts | 4 parts | ~2 hours |
| **Total** | **~97 parts** | **~58 hours** |

*Print times estimated at 60mm/s with 0.2mm layer height*

## Assembly

See [Assembly Guide](../../../docs/hardware/enclosure/assembly.md) for detailed step-by-step instructions with photos.

## Credits

Enclosure designed by Tadd Torborg (KA2DEW) for the TARPN project.
