# Enclosure Assembly Guide

Step-by-step instructions for assembling the single-wide nodebox enclosure.

## Parts List (Print Quantities)

| Qty | File | Description |
|-----|------|-------------|
| 1 | `nut-placer-in-beam-2025mar16-1.stl` | Assembly tool |
| 16 | `beam-2025apr25-1.stl` | Horizontal beams |
| 16 | `corner-tower-T2025may01-1.stl` | Corner posts |
| 4 | `bottom-panel-key.stl` | Bottom panel locks |
| 4 | `bottom-panel-stephen-2024sep05-1.stl` | Bottom panels |
| 4 | `foot-jul15-1.stl` | Rubber foot mounts |
| 1 | `battery-jan02-1.stl` | Battery holder |
| 4 | `coax-hole-53mm-25jan02-1.stl` | Coax feedthrough |
| 1 | `hinged-200mm-panel-2025may23-1.stl` | Hinged access panel |
| 4 | `ninotnc-tray-handle-2025apr28-2.stl` | TNC tray handles |
| 4 | `ninotnc-vertical-a4-tray-2025apr30-1.stl` | Vertical TNC trays |
| 1 | `control-panel-25may27-2.stl` | Main control panel |
| 1 | `ethernet-socket-july30-1.stl` | Ethernet port cutout |
| 1 | `fuse-holder-2025apr12-2.stl` | Fuse holder mount |
| 1 | `hdmi-and-usb-big-socket-hole-2025apr03-1.stl` | HDMI/USB cutout |
| 1 | `power-supply-panel-25feb01-1.stl` | Power supply panel |
| 1 | `power-supply-support-2025mar21-3.stl` | Power supply bracket |
| 1 | `right-half-with-vent-holes-25feb25-7.stl` | Vented right panel |
| 4 | `roof-corner-25jan03-1.stl` | Roof corner pieces |
| 4 | `roof-edge-beam-25jan04-2.stl` | Roof edge beams |
| 4 | `roof-quadrant-25jan05-1.stl` | Roof quadrant panels |
| 11 | `side-panel-jul09-1.stl` | Side panels |
| 4 | `ninotnc-panel-jul15-2.stl` | TNC front panels |
| 6 | `vented-53mm-jul16-1.stl` | Vented 53mm holes |

### Radio Mounts (Choose Based on Your Radios)

| Qty | File | Description |
|-----|------|-------------|
| 4 | `tait-radio-25jan03-1.stl` | Tait radio mount |
| - | `vertex_Mount_20250421-1.stl` | Vertex radio mount |
| - | `yeasu-ftm3100r-2025apr12-1.stl` | Yaesu FTM-3100R mount |

## Hardware Required

- M3 x 10mm screws (qty: ~50)
- M3 x 35mm screws (qty: 4)
- M3 square nuts (qty: ~60)
- M3 round lugs (qty: as needed)
- 2.5mm hex driver

## Assembly Instructions

### Step 1: Bottom Panel Assembly

1. Obtain 4 bottom-panel-keys and 4 bottom-panels
2. Assemble them into a square with the edges and corner posts facing up
3. Obtain the foot objects
4. Insert square nuts, 2 per foot
5. Use two M3 10mm screws in each bottom-panel to attach the foot
6. Repeat for all 4 bottom-panels

### Step 2: Corner Tower and Beam Assembly

1. Obtain 4 beams and 4 corner-towers
2. Assemble two corner-towers on either side of a single beam such that the hook slots of each corner tower blends into the hook slots at the end of the beam
3. Orient the 3 parts with the two towers up and the beam setting on the table
4. Insert M3 square nuts into the two slots which are facing up on the corner towers where they connect to the beam
5. Obtain a 10mm long M3 screw and insert it into the beam on the inside of the two ends to intersect with the inserted M3 square nut
6. Tighten the two 10mm M3 screws using a 2.5mm driver
7. Make another assembly with two corner towers and one beam - including screwing the 3 parts together
8. Obtain two more beams and attach them (and screw them) into the two previously unused connector-legs on the corner towers of one of the assemblies
9. Attach the 2nd corner-tower/beam/corner-tower to the open ends of the two beams

### Step 3: Join Frame to Base

1. Lay the 4 beams + 4 corner-towers assembly on the bottom-panels and snap them together
2. Observe the beam/tower assembly and note that there are seven hook positions on each side of the four-sided structure
3. If you look into each hook receiver, you will see there are slots for M3 square nuts
4. There are two nut-slots in the hooks at each tower and four more in the hook receivers on each beam

### Step 4: Install Square Nuts

1. Slide the nuts into the slots and force them to line up on the screw hole through the face of the beam and tower by using the nut placer tool
2. **Tip:** Tilting the entire structure left (30 degrees or so) and right can give you a nice slot to slide the nuts in
3. Two of the slots are in unfortunate positions where canting can't help - use the supplied placement tool to aid installation of M3 square nuts in those slots
4. Repeat this process for all four corner towers and all four beams
5. Install 10mm screws in 24 locations through the bottom quadrant panels and into the corner-towers and beams

### Step 5: Corner Tower Long Screws

1. Place a square nut in the inside/back of the corner tower
2. Use a 35mm screw partially screwed into the nut to force the nut into position on the back (inside view) of the corner tower
3. Unscrew the 35mm screw and then insert that screw into the outside view of the tower and thread it in
4. As the 35mm screw reaches the captive square nut, hold the square nut into place with a finger and slowly screw the 35mm into the nut
5. Remove your finger and then tighten the 35mm into the screw
6. Repeat for the other 3 corners

### Step 6: Control Panel PCB Assembly

1. Assemble the Control Panel PCB with:
   - LEDs
   - Pushbuttons
   - Slide switch
   - Battery lugs (on back)
   - 2x5 header (on back)

### Step 7: Control Panel Installation

1. Obtain the Control Panel pieces (control panel back-shield and boost-regulator platform)
2. Using four slide-in nuts and four 10mm screws, install the control panel
3. Using two slide-in nuts and two 10mm screws, install the control panel shield

### Step 8: Boost Regulator

1. Obtain the Boost regulator and boost regulator platform
2. Using four 2.5mm screws and nuts, mount the Boost regulator to the platform

### Step 9: Power Wiring

**Wire preparation:**

- 2x 6" pieces of black/white wire (16-20 gauge) - strip and tin one end 1/4"
- 1x 18" piece of black/white wire (16-20 gauge)
- 1x 14" piece of red/black zip-cord wire (16-20 gauge)

!!! note
    The 18" and 14" lengths provide extra room. Cut them to fit before attaching a lug to the other end - do that later, after the box assembly is started.

1. Split the red and black for 2"
2. Attach four Negative wires to a single round-lug
3. Screw the round-lug to a hole in the Control Panel platform
4. The lug will be on the 'top' of the platform along with the Boost regulator

**Wire destinations from the negative lug:**
- Negative terminal on the battery
- Negative bus on the fuse box
- Both ends of the Boost regulator

!!! tip
    Strip the two short negative wires to the Boost regulator about 1/4 inch and tin with solder before attaching to the Boost Regulator screw terminals.

### Step 10: Continue Assembly

*Additional steps for radio mounting, NinoTNC installation, and roof assembly to be added.*

---

## Tips

- Keep M3 square nuts organized - you'll need many of them
- The nut placer tool is essential for difficult-to-reach slots
- Tilting the frame helps nuts slide into position
- Don't fully tighten screws until all parts are in place
- Test fit components before final assembly

## Next Steps

After completing the enclosure:

1. [Mount the Raspberry Pi](../raspberry-pi.md)
2. [Install NinoTNCs](../ninotnc.md)
3. [Wire the radios](../radios.md)
4. [Connect power](../power.md)
