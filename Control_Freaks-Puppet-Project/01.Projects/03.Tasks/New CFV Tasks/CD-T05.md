---
title: "Task CD-T05 – Export Gerbers and BOM; Prep for PCB Manufacturing"
date: "2025-06-13"
project: "Control Freaks Vault"
status: "not started"
priority: "High"
tags: ["task", "controller-development", "CD-T05", "gerbers", "bom", "pcb-prep"]
---

# Task CD-T05 – Export Gerbers and BOM; Prep for PCB Manufacturing

---

## Task Overview

#### Task ID: CD-T05

- **Description**:  
  Generate the necessary files for PCB fabrication and part sourcing. This includes producing Gerber files, NC drill files, a Bill of Materials (BOM), and component placement (Pick & Place) files. Review fabrication settings to ensure alignment with chosen PCB manufacturer specifications.

- **Assigned To**: Thomas Ware

- **Start Date**: 2025-06-23  
- **End Date**: 2025-06-24

- **Status**: Not Started

- **Progress Details**:  
  Begins after CD-T04 layout is finalized. Output files must follow JLCPCB or PCBWay standard formats. BOM should be filtered for availability and include alternate parts for critical components. Output will be validated using the manufacturer’s preview tool.

- **Resources Allocated**:
  - KiCAD Gerber Export Wizard
  - JLCPCB/PCBWay DFM Guidelines
  - Component library with LCSC part numbers
  - OpenBOM spreadsheet template
  - Stack-up configuration sheet

- **Dependencies**:
  - Completion and sign-off of PCB layout (CD-T04)
  - Manufacturer fabrication spec sheet

- **Challenges or Issues**:
  - Incorrect drill file formats or misaligned silkscreen can cause rejections
  - Incomplete BOMs may delay ordering or raise sourcing costs

- **Impact on Project**:
  - Direct input for PCB and part ordering (CD-T06)
  - Affects cost, lead time, and physical build window

---

## Additional Notes

- **Feedback or Concerns**:
  - Verify polarity markings are clear on silkscreen layer
  - Include ‘DO NOT POPULATE’ notes for optional debug headers

- **Adjustments or Changes**:
  - Export for 2-layer stack-up with HASL finish unless heat dissipation requires ENIG

---

### 🔗 Related Documents

- [[CD-T04 – Generate and Verify PCB Layout]]
- [[Tasks and Activities Breakdown – Control Freaks Puppet Project]]
- [[Budget_Plan]]
- [[Resource_Allocation]]
- [[Timeline - Note]]

---

### 📁 Location in PARA Framework

`/Projects/Control_Freaks_Vault/Controller_Development/CD-T05_Gerbers_and_BOM.md`
