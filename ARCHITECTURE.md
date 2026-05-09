# Among Us 3D - Architecture Documentation

## System Overview

This document outlines the high-level architecture and design patterns used in the Among Us 3D multiplayer game.

## Core Systems

### 1. Game Management System

**GameManager.cs**
- Singleton pattern for global game state
- Handles game flow (lobby → game → voting → end)
- Manages scene transitions
- Coordinates between subsystems

### 2. Network Architecture

**Photon PUN 2 Integration**
- RPC call management
- Player synchronization via OnPhotonSerializeView
- Room creation/joining
- Custom properties for game state

### 3. Player System

**PlayerController.cs**
- Main player entity
- Handles input and player actions
- Manages player state (alive, dead, ghost, etc.)

**PlayerStats.cs**
- Health tracking
- Role assignment
- Status effects (shielded, doused, etc.)

### 4. Role System (Plugin Architecture)

**Design Pattern: Strategy + Observer**

## Communication Patterns

### RPC Patterns

**Critical Actions (Guaranteed):**
- Kill actions
- Vote submissions
- Role-specific abilities

**Non-Critical (Best Effort):**
- Ability cooldown sync
- Minor animation triggers

### Event System

Internal events (non-networked):

## Configuration Management

**GameSettings.cs**
- PlayerSpeed: 0.5x - 3.0x
- KillCooldown: 10s - 120s
- TaskDuration: 5s - 300s
- MeetingDuration: 30s - 300s
- Roles: Enable/disable each role individually
- GameDuration: 30m - 120m max

Loaded from:
- Scriptable object (default)
- Settings panel (in-game customization)
- Photon custom properties (networked)

## Camera System

**3rd-Person Over-Shoulder:**
- Target offset behind player
- Height above ground
- Distance from player
- Smooth follow with damping
- Occlusion handling

## Visual Hierarchy

## Serialization Strategy

### Position Updates (Per Frame)
```csharp
void OnPhotonSerializeView(PhotonStream stream, PhotonMessageInfo info) {
    if (stream.IsWriting) {
        stream.SendNext(transform.position);
        stream.SendNext(animator.GetCurrentAnimatorStateInfo(0).fullPathHash);
    } else {
        Vector3 position = (Vector3)stream.ReceiveNext();
        int animHash = (int)stream.ReceiveNext();
    }
}
[PunRPC]
void KillPlayer(int targetID) {
    // Executed on all clients
    // Validate locally, execute universally
}
