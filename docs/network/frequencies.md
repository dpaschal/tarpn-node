# Frequency Allocation

TARPN links operate on simplex frequencies in VHF and UHF amateur bands. Each link between two nodes uses a dedicated frequency.

## Frequency Bands

### 2 Meter (VHF) - 144-148 MHz

Primary band for most TARPN links due to good propagation and available surplus equipment.

| Frequency Range | Use |
|-----------------|-----|
| 144.91 - 145.09 | Packet/data (weak signal adjacent) |
| 145.50 - 145.80 | Misc/experimental |
| 146.40 - 146.58 | Simplex |
| 147.42 - 147.57 | Simplex |

### 70 Centimeter (UHF) - 420-450 MHz

Good for shorter links with less interference.

| Frequency Range | Use |
|-----------------|-----|
| 420.00 - 426.00 | Digital/packet modes |
| 430.00 - 432.00 | Digital/mixed |
| 440.00 - 445.00 | Shared simplex |
| 445.00 - 447.00 | Shared simplex |

### 1.25 Meter (222 MHz)

Less common but excellent for packet with minimal interference.

| Frequency Range | Use |
|-----------------|-----|
| 222.10 - 223.38 | Weak signal/digital |
| 223.52 - 223.64 | Simplex digital |

## NC Packet Coordination

The NC Packet network (ncpacket.net) maintains a frequency coordination database. Check with your regional coordinator before selecting frequencies.

### Typical NC Packet Allocations

| Band | Common Frequencies |
|------|-------------------|
| 2m | 145.01, 145.03, 145.05, 145.07, 145.09 |
| 70cm | 441.025, 441.050, 441.075, 445.925, 445.950 |

## Selecting a Frequency

### Guidelines

1. **Check coordination database** - See if frequency is already in use nearby
2. **Avoid repeater inputs/outputs** - Don't interfere with voice repeaters
3. **Use designated packet segments** - Prefer frequencies allocated for data
4. **Coordinate with neighbor** - Both nodes must use same frequency
5. **Consider propagation** - Higher frequencies = shorter range

### Frequency Separation

For multiple links at the same site:

| Band | Minimum Separation |
|------|-------------------|
| 2m | 20 kHz between channels |
| 70cm | 25 kHz between channels |

### Example 4-Port Node

```
Port 1 (Link to Node A): 145.01 MHz
Port 2 (Link to Node B): 145.03 MHz
Port 3 (Link to Node C): 441.025 MHz
Port 4 (Link to Node D): 441.050 MHz
```

## Baud Rate vs Bandwidth

| Baud Rate | Bandwidth | Notes |
|-----------|-----------|-------|
| 1200 | 12.5 kHz | Standard AFSK, most compatible |
| 9600 | 25 kHz | G3RUH FSK, recommended |
| 19200 | 25 kHz | High speed G3RUH |

!!! tip "9600 Baud Recommended"
    Use 9600 baud for best throughput while maintaining reliable links. 1200 baud only if distance requires it.

## Programming Your Radio

Most radios need to be programmed with:

- **Receive frequency** - Same as transmit for simplex
- **Transmit frequency** - Same as receive for simplex
- **Squelch** - Set to open or carrier squelch
- **Power** - Usually low/medium (5-25W)
- **CTCSS/DCS** - Not used (disable)
- **Narrow/Wide** - Wide for 9600 baud

## Avoiding Interference

### Don't Use

- Repeater input/output pairs
- Calling frequencies (146.52, 446.00, etc.)
- Satellite frequencies
- Emergency/ARES frequencies
- Active simplex channels in your area

### Monitoring

Before going live:

```bash
# Listen for activity on your planned frequency
tarpn listen 1
```

## Frequency Plan Template

| Port | Direction | Frequency | Band | Baud | Neighbor |
|------|-----------|-----------|------|------|----------|
| 1 | East | 145.01 | 2m | 9600 | N0CALL-2 |
| 2 | West | 145.03 | 2m | 9600 | K0ABC-2 |
| 3 | North | 441.025 | 70cm | 9600 | W0XYZ-2 |
| 4 | South | 441.050 | 70cm | 9600 | K0QRS-2 |

## Coordination Resources

- **NC Packet**: [ncpacket.net](https://ncpacket.net) - Southeastern US coordination
- **TARPN**: [tarpn.net](https://tarpn.net) - General TARPN information
- **ARRL Band Plan**: [arrl.org/band-plan](https://www.arrl.org/band-plan) - Official band plans
