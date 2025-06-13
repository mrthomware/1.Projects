---
title: "Task PD-T04 – Slice Models and Prepare 3D Print Files"
date: "2025-07-27"
project: "Control Freaks Vault"
status: "not started"
priority: "High"
tags: ["task", "puppet-development", "PD-T04", "3d-printing", "slicer", "cad-prep"]
---

# Task PD-T04 – Slice Models and Prepare 3D Print Files

---

## Task Overview

#### Task ID: PD-T04

- **Description**:  
  Convert the puppet's 3D CAD model into printable segments using slicing software. Apply optimal print settings per part (infill, supports, orientation) to ensure print success, mechanical durability, and post-processing efficiency. Export finalized G-code or STL files for the 3D printer used.

- **Assigned To**: Thomas Ware

- **Start Date**: 2025-07-27  
- **End Date**: 2025-07-28

- **Status**: Not Started

- **Progress Details**:  
  - Model broken into modular print sections  
  - Mount holes and registration keys verified  
  - Slicer settings customized per part (e.g., 30% infill for base, 15% for head)  
  - Overhangs analyzed for support structure optimization

- **Resources Allocated**:
  - CAD files from PD-T03  
  - Slicing software (e.g., PrusaSlicer, Cura)  
  - 3D printer specs (nozzle size, max build volume)  
  - Material type (e.g., PLA+, PETG, resin)

- **Dependencies**:
  - Completion of PD-T03  
  - Confirmation of internal mounts and servo placements  
  - Availability of printing hardware and filament

- **Challenges or Issues**:
  - Complex part geometries requiring multi-orientation slicing  
  - Support removal impacting surface finish or internal cavities  
  - Balancing print strength and weight

- **Impact on Project**:
  - Successful slicing ensures proper fit, movement, and mechanical strength post-print  
  - Efficient slicing prevents wasted material and reduces print retries  
  - Sets up for a smooth transition into PD-T05 (printing)

---

## Additional Notes

- **Feedback or Concerns**:
  - Test one small component before committing to full body slicing  
  - Log estimated print time per part for timeline accuracy

- **Adjustments or Changes**:
  - If parts exceed build volume, use keyed joints or dovetail slices  
  - Update shell offsets if servo sizes require tolerance adjustments

---

### 🔗 Related Documents

- [[PD-T03 – Design Internal Mounts and Wire Guides]]  
- [[PD-T05 – 3D Print All Body and Mount Parts]]  
- [[CD-T06 – Order PCBs and Components]]

---

### 📁 Location in PARA Framework

`/Projects/Control_Freaks_Vault/Puppet_Development/PD-T04_Slice_Models.md`
