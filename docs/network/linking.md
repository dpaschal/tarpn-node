# Linking Nodes

!!! note "Documentation In Progress"
    This page is under construction. Check back soon!

## Overview

TARPN nodes connect via dedicated point-to-point radio links. Each link uses a single frequency between exactly two nodes.

## Link Setup Steps

1. Coordinate frequency with neighbor
2. Configure radio on both ends
3. Add neighbor to `node.ini`
4. Run `tarpn config` to update BPQ
5. Test with `tarpn linktest`

## Link Quality

Monitor link health:

```bash
tarpn listen 1    # Monitor port 1
tarpn linktest 1  # Send test packets
```

## Resources

- [Frequency Allocation](frequencies.md)
- [Network Rules](rules.md)
- [BPQ Configuration](../software/bpq-config.md)
