# Network Architecture

TARPN uses a mesh network topology where each node connects to multiple neighbors via dedicated point-to-point radio links.

## Network Topology

```
        ┌───────┐           ┌───────┐
        │Node A │───────────│Node B │
        └───┬───┘           └───┬───┘
            │                   │
            │     ┌───────┐     │
            └─────│Node C │─────┘
                  └───┬───┘
                      │
                  ┌───┴───┐
                  │Node D │
                  └───────┘
```

Each link is a dedicated simplex (one frequency) or half-duplex connection between exactly two nodes.

## Protocol Stack

| Layer | Protocol | Description |
|-------|----------|-------------|
| Application | BBS, Chat, Telnet | User services |
| Session | NET/ROM | Node routing and session management |
| Transport | AX.25 / IL2P | Packet framing, FEC |
| Physical | FM Radio | VHF/UHF modulation |

## Routing

TARPN nodes use NET/ROM (Network Routing) protocol implemented by LinBPQ:

- **Automatic route discovery** - Nodes broadcast routing tables
- **Quality-based routing** - Links scored by reliability
- **Multi-hop forwarding** - Packets routed through network
- **Alias addressing** - Human-readable node names

## Link Types

### Point-to-Point Radio Links

The primary link type. Each radio port connects to exactly one neighbor.

```
[Node A Radio 1] ──── frequency 1 ────> [Node B Radio 2]
                <──── frequency 1 ─────
```

Configuration:

- Simplex frequency per link
- 9600 baud recommended (1200 baud minimum)
- IL2P protocol for FEC

### AXIP/AXUDP Links (Internet)

Connect distant nodes over the Internet:

```
[Node A] ──── Internet ────> [Node B]
```

!!! warning "Not Recommended"
    Internet links bypass the amateur radio purpose of TARPN. Use sparingly for critical backbone connections only.

## Node Types

### Full Node

- 2-4 radio ports
- Part of the mesh backbone
- Routes traffic for other nodes

### Leaf Node

- 1-2 radio ports
- Connects to the network but doesn't route
- End-user access point

### Gateway Node

- Provides Internet connectivity (email, etc.)
- Connects to external services
- Usually also a full node

## Quality Metrics

LinBPQ assigns quality scores to each link:

| Quality | Description |
|---------|-------------|
| 255 | Perfect (direct connection) |
| 203 | Excellent radio link |
| 150 | Good radio link |
| 100 | Marginal link |
| < 100 | Poor link |

Quality is used for routing decisions - higher quality paths preferred.

## Traffic Flow

### Local Traffic

```
[User] ──> [Local Node] ──> [Application]
```

### Remote Traffic

```
[User] ──> [Node A] ──> [Node B] ──> [Node C] ──> [Application]
```

The network automatically routes packets through the optimal path.

## Services

### BBS (Bulletin Board System)

- Personal mailboxes
- Bulletin boards
- Message forwarding between nodes

### Chat

- Real-time keyboard-to-keyboard
- Group chat rooms
- Available via TARPN-HOME web interface

### Telnet

- Remote node access
- Command line interface
- Diagnostic tools

## Network Coordination

### NC Packet (North Carolina)

The original TARPN network, coordinated through ncpacket.net.

### Frequency Coordination

- Coordinate with neighbors to avoid interference
- See [Frequencies](frequencies.md) for allocation guide

### Linking Guidelines

- Only link to neighbors you can reliably reach
- Maintain links you commit to
- See [Network Rules](rules.md) for policies
