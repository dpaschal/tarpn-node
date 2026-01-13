# Single-Wide Nodebox STL Files

3D printable enclosure for a TARPN node with dual radios and dual NinoTNCs.

**Design Version:** 2025-09-13

## Parts List

### Structural Components

| File | Qty | Description |
|------|-----|-------------|
| `corner-tower-T2025may01-1.stl` | 4 | Main corner posts |
| `beam-2025apr25-1.stl` | 4+ | Horizontal beams |
| `foot-jul15-1.stl` | 4 | Rubber foot mounts |

### Panels

| File | Qty | Description |
|------|-----|-------------|
| `full-panel-jul10-2.stl` | - | Full-width panel |
| `left-half-panel-jul12-2.stl` | 1 | Left side half-panel |
| `right-half-panel-aug01-2.stl` | 1 | Right side half-panel |
| `right-half-with-vent-holes-25feb25-7.stl` | 1 | Vented right panel |
| `side-panel-jul09-1.stl` | 2 | Side panels |
| `bottom-panel-stephen-2024sep05-1.stl` | 1 | Bottom panel |
| `bottom-panel-key.stl` | 1 | Bottom panel key/lock |
| `hinged-200mm-panel-2025may23-1.stl` | 1 | Hinged access panel |
| `blank-right-hand-front-plate-2024jul05-1.stl` | 1 | Blank front plate |

### Roof Components

| File | Qty | Description |
|------|-----|-------------|
| `roof-corner-25jan03-1.stl` | 4 | Roof corner pieces |
| `roof-edge-beam-25jan04-2.stl` | 4 | Roof edge beams |
| `roof-quadrant-25jan05-1.stl` | 4 | Roof quadrant panels |

### NinoTNC Mounting

| File | Qty | Description |
|------|-----|-------------|
| `ninotnc-panel-jul15-2.stl` | 2 | TNC front panel |
| `ninotnc-tray-handle-2025apr28-2.stl` | 2 | TNC tray handle |
| `ninotnc-vertical-a4-tray-2025apr30-1.stl` | 2 | Vertical TNC tray |

### Power & Control

| File | Qty | Description |
|------|-----|-------------|
| `control-panel-25may27-2.stl` | 1 | Main control panel |
| `power-supply-panel-25feb01-1.stl` | 1 | Power supply panel |
| `power-supply-support-2025mar21-3.stl` | 1 | Power supply bracket |
| `fuse-holder-2025apr12-2.stl` | 1+ | Fuse holder mount |
| `battery-jan02-1.stl` | 1 | Battery holder |

### I/O Cutouts

| File | Qty | Description |
|------|-----|-------------|
| `ethernet-socket-july30-1.stl` | 1 | Ethernet port cutout |
| `hdmi-and-usb-big-socket-hole-2025apr03-1.stl` | 1 | HDMI/USB cutout |
| `coax-hole-53mm-25jan02-1.stl` | 2+ | Coax feedthrough (53mm) |
| `vented-53mm-jul16-1.stl` | - | Vented 53mm hole |

### Radio Mounts

| File | Qty | Description |
|------|-----|-------------|
| `tait-radio-25jan03-1.stl` | - | Tait radio mount |
| `vertex_Mount_20250421-1.stl` | - | Vertex radio mount |
| `yeasu-ftm3100r-2025apr12-1.stl` | - | Yaesu FTM-3100R mount |

### Tools

| File | Description |
|------|-------------|
| `nut-placer-in-beam-2025mar16-1.stl` | Tool for inserting nuts into beams |

### Multi-Part Files

| File | Description |
|------|-------------|
| `corners_and_beams.3mf` | Combined print of corners and beams |

## Print Settings

**Recommended:**
- **Material:** PLA or PETG
- **Layer Height:** 0.2mm
- **Infill:** 20-30%
- **Walls:** 3 perimeters
- **Top/Bottom:** 4 layers

**Per-Part Notes:**
- Structural parts (corners, beams): 30% infill for strength
- Panels: 20% infill is sufficient
- Radio mounts: PETG preferred for heat resistance

## Hardware Required

- M3 x 8mm screws (qty: ~50)
- M3 nuts (qty: ~30)
- M3 heat-set inserts (optional, for reusable joints)
- M4 screws for radio mounting

## Assembly Order

1. Print and assemble corner towers with beams (frame)
2. Add feet to bottom corners
3. Install bottom panel
4. Mount power supply bracket
5. Install side panels
6. Mount NinoTNC trays
7. Install radio mounts
8. Add I/O cutouts and panels
9. Install roof components
10. Add control panel last

See [Assembly Guide](../../../docs/hardware/enclosure/assembly.md) for detailed instructions.
