# Troubleshooting

!!! note "Documentation In Progress"
    This page is under construction. Check back soon!

## Common Issues

### Node Won't Start

```bash
# Check status
tarpn

# View logs
tarpn log

# Test interactively
tarpn test
```

### TNC Not Detected

```bash
# List USB devices
tarpn usb

# Check permissions
ls -la /dev/ttyUSB*

# Add user to dialout group
sudo usermod -a -G dialout pi
```

### No RF Activity

1. Check antenna connections
2. Verify radio programming
3. Check PTT line with `tarpn identify`
4. Monitor with `tarpn listen 1`

### Poor Link Quality

1. Check signal levels
2. Adjust TX deviation
3. Verify baud rate matches neighbor
4. Consider switching to IL2P

## Getting Help

- [TARPN Mailing List](https://tarpn.net)
- [NC Packet Forums](https://ncpacket.net)
- [GitHub Issues](https://github.com/dpaschal/tarpn-node/issues)
