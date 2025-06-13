---
title: "Task PD-T11 – Calibrate Servo Ranges and PWM Values"
date: "2025-08-13"
project: "Control Freaks Vault"
status: "not started"
priority: "High"
tags: ["task", "puppet-development", "PD-T11", "servo-calibration", "PWM"]
---

# Task PD-T11 – Calibrate Servo Ranges and PWM Values

---

## Task Overview

#### Task ID: PD-T11

- **Description**:  
  Fine-tune the servo movements by calibrating their minimum and maximum PWM values to match the mechanical range of each joint. Prevent overextension and ensure full expressive articulation without binding or strain.

- **Assigned To**: Thomas Ware

- **Start Date**: 2025-08-13  
- **End Date**: 2025-08-14

- **Status**: Not Started

- **Progress Details**:  
  - Upload test sketch to sweep servos through range  
  - Use serial monitor to record actual working PWM limits  
  - Map each servo’s operational values to intended movement  
  - Document results in calibration table for firmware integration

- **Resources Allocated**:
  - USB serial monitor tools (e.g., Arduino IDE)  
  - Test code (servo sweep and positional range mapping)  
  - Calibration worksheet (spreadsheet or markdown log)  
  - Power supply (regulated for servo draw)

- **Dependencies**:
  - PD-T10 (movement must be tested and validated)  
  - CD-T11 (base firmware structure must be defined)

- **Challenges or Issues**:
  - Some servos may respond differently due to internal variance  
  - Risk of damaging hardware if PWM exceeds safe limits  
  - Repeated testing may fatigue plastic joints if overdone

- **Impact on Project**:
  - Ensures puppeteering accuracy  
  - Essential for syncing visuals with audio motion  
  - Calibration data feeds into firmware control logic

---

## Additional Notes

- **Feedback or Concerns**:
  - If servo behaves erratically, swap unit and retest  
  - Update naming convention for servo labels (e.g., `JAW_SERVO_PWM_MIN/MAX`)

- **Adjustments or Changes**:
  - Add software clamps in firmware for safety  
  - Incorporate calibration config file for override during live debugging

---

### 🔗 Related Documents

- [[PD-T10 – Test Fit Movement and Check Clearances]]  
- [[CD-T11 – Write Firmware Base Structure]]  
- [[CD-T13 – Write and Integrate Audio-Sync Timing Module]]

---

### 📁 Location in PARA Framework

`/Projects/Control_Freaks_Vault/Puppet_Development/PD-T11_Calibrate_Servo_Ranges_PWM_Values.md`
