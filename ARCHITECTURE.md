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
