---
title: "Task OV-T01 – Backup Full Working Directory and Raw Project Files"
date: "2025-09-17"
project: "Control Freaks Vault"
status: "not started"
priority: "High"
tags: ["task", "obsidian-vault", "backup", "OV-T01"]
---

# Task OV-T01 – Backup Full Working Directory and Raw Project Files

---

## Task Overview

#### Task ID: OV-T01

- **Description**:  
  Create a full backup of the working project directory, including all CAD files, firmware, video footage, and documentation. The backup must be archived in a structured folder and stored both locally and in cloud storage.

- **Assigned To**: Thomas Ware

- **Start Date**: 2025-09-17  
- **End Date**: 2025-09-17

- **Status**: Not Started

- **Progress Details**:
  - Duplicate and compress key directories: `/Design`, `/Firmware`, `/Footage`, `/Docs`  
  - Label archive with project version and date  
  - Verify integrity of archive (ZIP or TAR format)  
  - Upload to designated cloud drive and external HDD

- **Resources Allocated**:
  - 1TB external HDD  
  - Google Drive folder: `ControlFreaks_Backups/2025/`  
  - File compression tools (e.g., 7-Zip, WinRAR)

- **Dependencies**:
  - Completion of all build and content development (Phases 1–3)

- **Challenges or Issues**:
  - File path length or character encoding errors during compression  
  - Cloud upload failures or versioning conflicts

- **Impact on Project**:
  - Serves as a point-in-time snapshot for archival, rollback, and version control  
  - Ensures disaster recovery readiness and long-term data preservation

---

## Additional Notes

- **Feedback or Concerns**:
  - Include `.obsidian` config only if consistent with other vault snapshots  
  - Exclude unused render drafts or CAD revisions unless tagged as `final`

- **Adjustments or Changes**:
  - Backup scripts can be refined in OV-T02 to auto-trigger on final milestone completion

---

### 🔗 Related Documents

- [[OV-T02 – Structure PARA Folders and Insert Project Artifacts]]  
- [[OV-T08 – Publish Final Report and MOC Map in Vault]]  
- [[Tasks and Activities Breakdown – Control Freaks Puppet Project]]

---

### 📁 Location in PARA Framework

`/Projects/Control_Freaks_Vault/Obsidian_Vault/OV-T01_Backup_Working_Directory.md`
