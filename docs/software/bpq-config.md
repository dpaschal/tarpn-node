# BPQ Configuration Reference

!!! note "Documentation In Progress"
    This page is under construction. Check back soon!

## Overview

LinBPQ uses `bpq32.cfg` as its main configuration file. This defines ports, routing, and services.

## Basic Structure

```
; Node identity
NODECALL=N0CALL-2
NODEALIAS=MYNODE
LOCATOR=EM95

; Port definitions
PORT
  PORTNUM=1
  ID=VHF 9600
  TYPE=ASYNC
  PROTOCOL=KISS
  COMPORT=/dev/ttyUSB0
  SPEED=57600
ENDPORT

; Applications
APPLICATION 1,BBS,,N0CALL-1,BBS,256
APPLICATION 2,CHAT,,N0CALL-3,CHAT,256
```

## Port Parameters

| Parameter | Description |
|-----------|-------------|
| PORTNUM | Port number (1-32) |
| COMPORT | Serial device path |
| SPEED | Serial baud rate (57600 for NinoTNC) |
| PERSIST | CSMA persistence (225 typical) |
| SLOTTIME | Slot time in ms (20 typical) |
| TXDELAY | TX delay in ms |

## Resources

- [Example Config](https://github.com/dpaschal/tarpn-node/blob/main/config/examples/dual-port.cfg)
- [G8BPQ Documentation](https://www.cantab.net/users/john.wiseman/Documents/)
