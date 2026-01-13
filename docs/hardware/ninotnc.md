# NinoTNC N9600A

The NinoTNC N9600A is the recommended TNC (Terminal Node Controller) for TARPN nodes. Designed by Nino Carrillo (KK4HEJ), it's a multi-mode USB KISS TNC supporting amateur packet radio from 300 to 19,200 baud.

**Designer:** Nino Carrillo, KK4HEJ

**In Service:** Over 2,800 boards shipped, 120+ units in NC Packet network

## Specifications

| Specification | Value |
|---------------|-------|
| Interface | USB serial at 57,600 baud |
| Protocol | KISS |
| Layer 2 | AX.25, IL2P, IL2P+CRC |
| Baud Rates | 300, 1200, 2400, 3600, 4800, 9600, 19200 |
| RX Input | 0.3V - 3V peak-to-peak |
| Connectors | 9-pin DE9 (kit) or 6-pin mini-DIN (SMT) |
| Power | USB powered (5V) |

## Operating Modes

The NinoTNC supports 16 modes via the MODE switch, covering three protocol families:

### Legacy AX.25 Modes

| Mode | Baud | Modulation | Use Case |
|------|------|------------|----------|
| 300 AFSK | 300 | 1600/1800 Hz tones | SSB HF packet |
| 1200 AFSK | 1200 | Bell 202 | FM packet, APRS |
| 9600 GFSK | 9600 | G3RUH | High-speed FM |

### IL2P FEC Modes (Recommended)

| Mode | Baud | Modulation | Use Case |
|------|------|------------|----------|
| 300-600 BPSK/QPSK | 300-600 | PSK, 500 Hz BW | SSB HF |
| 1200-2400 BPSK/QPSK | 1200-2400 | PSK, 2400 Hz BW | FM/SSB |
| 3600 QPSK | 3600 | QPSK | FM (narrow filters OK) |
| 4800-19200 GFSK/C4FSK | 4800-19200 | G3RUH/FSK | Data port |

### Performance

| Mode | Throughput | Notes |
|------|------------|-------|
| 9600 G3RUH | 125 bytes/sec | With fast-switching radio |
| 2400 DPSK | Good | Works with mic-audio radios |
| 4800 GFSK | Good | For radios that can't do 9600 |

!!! info "IL2P Advantage"
    IL2P provides approximately **4dB improvement** in signal-to-noise ratio compared to AX.25.

## IL2P Protocol

The NinoTNC supports IL2P (Improved Layer 2 Protocol), which provides:

- **Forward Error Correction (FEC)** - Approximately 4dB improvement over standard AX.25
- **Better noise immunity** - More reliable links in marginal conditions
- **Backward compatible framing** - Works with existing AX.25 infrastructure
- **Designed by KK4HEJ** - Specifically for amateur radio packet

!!! tip "Use IL2P"
    IL2P is strongly recommended for TARPN links. It provides significant performance improvement with no hardware changes.

## Connections

### Audio Connections

The NinoTNC uses a 6-pin mini-DIN connector for radio audio:

| Pin | Signal | Description |
|-----|--------|-------------|
| 1 | TX Audio | Transmit audio to radio |
| 2 | Ground | Audio ground |
| 3 | PTT | Push-to-talk (ground to transmit) |
| 4 | RX Audio | Receive audio from radio |
| 5 | Ground | Audio ground |
| 6 | +5V | Optional power output |

### USB Connection

Connect to any USB port on the Raspberry Pi. The NinoTNC appears as `/dev/ttyUSB0`, `/dev/ttyUSB1`, etc.

## Configuration

### Checking USB Connection

```bash
# List USB devices
tarpn usb

# Or manually
ls -la /dev/ttyUSB*
```

### Identifying TNCs

```bash
# Query TNC version
tarpn identify
```

### LinBPQ Port Configuration

In `bpq32.cfg`, configure a NinoTNC port:

```
PORT
  PORTNUM=1
  ID=VHF 9600 IL2P
  TYPE=ASYNC
  PROTOCOL=KISS
  COMPORT=/dev/ttyUSB0
  SPEED=57600
  CHANNEL=A
  PERSIST=128
  SLOTTIME=100
  TXDELAY=200
  TXTAIL=50
  QUALITY=203
  MAXFRAME=4
  FRACK=5000
  RESPTIME=1500
  RETRIES=5
  PACLEN=236
ENDPORT
```

## LED Indicators

The NinoTNC has five status LEDs:

| LED | Color | Designator | Function |
|-----|-------|------------|----------|
| CRC | Red | D5 | CRC errors, high RX volume warning |
| Queue | Blue | D6 | TX queue has data waiting |
| RX | Green | D4 | Successful packet received (2 sec) |
| DCD | Yellow | D3 | Data Carrier Detect active |
| PTT | Red | D1 | Transmitting |

**Startup Sequence:** Four-LED sweep pattern indicates reset or mode change.

**CRC LED Tuning:** Adjust receive volume until CRC LED flickers, then reduce until it stops - this is optimal receive level.

## Firmware Updates

### Check Current Version

```bash
tarpn identify
```

### Flash New Firmware

1. Download firmware from TARPN website
2. Place `.hex` file in `/usr/local/etc/ninotnc/versions/`
3. Run firmware flash utility:

```bash
tarpn flash
```

Or manually with Python:

```bash
python3 flashtnc.py /dev/ttyUSB0 firmware.hex
```

## Troubleshooting

### TNC Not Detected

1. Check USB cable connection
2. Verify with `dmesg | tail` after plugging in
3. Check permissions: `ls -la /dev/ttyUSB*`
4. Add user to dialout group: `sudo usermod -a -G dialout pi`

### No TX/RX Activity

1. Verify audio cable connections
2. Check radio squelch settings
3. Verify PTT line is working
4. Check baud rate matches neighbor

### Poor Link Quality

1. Try adjusting TX delay (`TXDELAY` in config)
2. Verify audio levels (not too hot or too quiet)
3. Check antenna and feedline
4. Consider switching to IL2P if using AX.25

## Hardware Versions

| Version | Period | Status |
|---------|--------|--------|
| A0, A1 | Aug 2018 - Jan 2020 | Unsupported |
| A2 | Jan 2020 - Aug 2020 | Supported (200 units) |
| A3 | May 2020 - Nov 2020 | Supported (800 units) |
| A4 | Dec 2020 - present | Current (thousands) |
| A4r3 | Feb 2024+ | Current production |

The A4r3 revision was created when the original MOSFET (Q1) was discontinued.

## Purchasing

### Kit Version (DIY)

- **PCB + CPU from ETSY:** ~$12 USD
- **Components from Mouser:** ~$30 USD
- **Total:** Under $40

### Assembled Units

- **RPC-Electronics:** ~$70 + shipping (SMT version)
- **HamServe.UK:** PCB, kits, or assembled (international)
- **OARC.UK via Tindie:** PCB + CPU (EU)

## Firmware

| CPU Type | Firmware Version |
|----------|------------------|
| dsPIC33EP256 | v3.44 (current) |
| dsPIC33EP512 | v4.44 (current) |

!!! warning "Firmware Compatibility"
    Use v3.X firmware for EP256GP CPU, v4.X for EP512GP CPU. Do not mix versions.

## KISS Parameters for LinBPQ

```
SPEED=57600
PROTOCOL=KISS
PERSIST=225
SLOTTIME=20
FRACK=6000    ; 1200 baud
FRACK=2000    ; 9600 baud
PACLEN=236    ; 1200 baud
PACLEN=202    ; 9600 baud
```

## Resources

- [Operator's Manual](https://tarpn.net/t/nino-tnc/n9600a/n9600a_operation.html)
- [Info & Ordering](https://tarpn.net/t/nino-tnc/n9600a/n9600a_info.html)
- [Assembly Instructions](https://tarpn.net/t/nino-tnc/n9600a/n9600a3/n9600a3-assembly.html)
- [Firmware Updater (GitHub)](https://github.com/ninocarrillo/flashtnc)
- [IL2P Protocol Documentation](https://tarpn.net/t/builder/builders_tarpn_protocols.html)
