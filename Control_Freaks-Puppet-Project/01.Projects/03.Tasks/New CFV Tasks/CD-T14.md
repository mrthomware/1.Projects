---
title: "Task CD-T14 – Test System on Bench Rig with Mock Signals"
date: "2025-07-16"
project: "Control Freaks Vault"
status: "not started"
priority: "High"
tags: ["task", "controller-development", "CD-T14", "testing", "bench-rig"]
---

# Task CD-T14 – Test System on Bench Rig with Mock Signals

---

## Task Overview

#### Task ID: CD-T14

- **Description**:  
  Perform full-system testing of the controller, firmware, and servo assembly using a bench-top test rig that simulates puppet behavior. Feed mock signal inputs into the system (e.g., cue triggers, button presses, dummy audio syncs) and observe servo reactions for timing accuracy, signal stability, and motion responsiveness.

- **Assigned To**: Thomas Ware

- **Start Date**: 2025-07-16  
- **End Date**: 2025-07-18

- **Status**: Not Started

- **Progress Details**:  
  - Assemble stable bench rig with mounted servos  
  - Simulate cue triggers from SP-T04  
  - Monitor system under load and analyze drift  
  - Capture logs for signal response time and movement accuracy  
  - Identify overheating or voltage drop under sustained cycles

- **Resources Allocated**:
  - Full controller + powered PCB  
  - Bench rig frame with mounted servos  
  - Mock cue signal generator (button panel or script)  
  - Oscilloscope or serial monitor for signal trace

- **Dependencies**:
  - CD-T13 (audio-sync firmware complete)  
  - PD-T11 (servos calibrated and mounted)  
  - SP-T04 (test cue sheet prepared)

- **Challenges or Issues**:
  - Servo flutter under load  
  - Timing drift from code-blocking operations  
  - Voltage sag from power distribution on PCB

- **Impact on Project**:
  - Critical gate before real puppet integration  
  - Identifies firmware or hardware faults before show rehearsal  
  - Last step in Controller Development Phase

---

## Additional Notes

- **Feedback or Concerns**:
  - Keep system running for extended time to test long-sequence heat thresholds  
  - Document jitter tolerance in final report for controller subsystem

- **Adjustments or Changes**:
  - If mock testing is unstable, simplify to one servo and scale up iteratively  
  - Switch signal capture method if oscilloscope latency is excessive

---

### 🔗 Related Documents

- [[CD-T13 – Write and Integrate Audio-Sync Timing Module]]  
- [[PD-T11 – Calibrate Servo Ranges and PWM Values]]  
- [[SP-T04 – Build Cue Sheets for Motion and Audio Sync]]

---

### 📁 Location in PARA Framework

`/Projects/Control_Freaks_Vault/Controller_Development/CD-T14_Bench_Testing.md`
