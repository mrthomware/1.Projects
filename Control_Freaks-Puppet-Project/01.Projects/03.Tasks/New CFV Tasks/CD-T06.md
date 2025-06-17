---
title: "Task CD-T06 – Order PCBs and Components"
date: "2025-06-14"
project: "Control Freaks Vault"
status: "not started"
priority: "High"
tags: ["task", "controller-development", "CD-T06", "ordering", "pcb", "components"]
---

# Task CD-T06 – Order PCBs and Components

---

## Task Overview

#### Task ID: CD-T06

- **Description**:  
  Submit fabrication order for the finalized PCB using the exported Gerber files. Place component orders using the approved BOM, prioritizing availability and lead times. Confirm shipping addresses and delivery windows. Include extra PCBs (≥5 units) and spares for critical components.

- **Assigned To**: Thomas Ware

- **Start Date**: 2025-06-24  
- **End Date**: 2025-06-25

- **Status**: Not Started

- **Progress Details**:  
  Prepares the physical resources needed for prototyping. Ordering should follow part supplier validation using LCSC, Digi-Key, or Mouser. For PCBs, preferred vendor is JLCPCB unless otherwise noted. Track order confirmations and estimated delivery dates in `/Logs/Order_Tracker.md`.

- **Resources Allocated**:
  - Gerber + drill files from CD-T05
  - BOM spreadsheet with LCSC/Mouser part numbers
  - Payment credentials for vendors
  - Order tracking spreadsheet

- **Dependencies**:
  - Successful export and verification of manufacturing files (CD-T05)
  - Budget approval for part and board costs

- **Challenges or Issues**:
  - Part stockouts or supplier lead times may delay prototyping
  - PCB manufacturing errors if Gerbers fail DRC validation

- **Impact on Project**:
  - Enables physical prototyping in CD-T07 and CD-T08
  - Delays here directly postpone the build timeline

---

## Additional Notes

- **Feedback or Concerns**:
  - Use JLCPCB SMT Assembly service if time-constrained; verify stencil generation if self-assembling
  - Include shipping buffer time of 3–5 days for customs/delivery errors

- **Adjustments or Changes**:
  - If LCSC stock is low, fallback to Digi-Key or Mouser at higher cost, with internal flag in BOM

---

### 🔗 Related Documents

- [[CD-T05 – Export Gerbers and BOM; Prep for PCB Manufacturing]]
- [[Budget_Plan]]
- [[Resource_Allocation]]
- [[Order_Tracker.md]]

---

### 📁 Location in PARA Framework

`/Projects/Control_Freaks_Vault/Controller_Development/CD-T06_Order_PCBS_and_Components.md`
