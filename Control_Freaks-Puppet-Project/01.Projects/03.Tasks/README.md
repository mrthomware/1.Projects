---
title: "README – Tasks Kanban Board"
date: "2025-06-13"
project: "Control Freaks Puppet Project"
document_type: "README"
status: "active"
tags: ["kanban", "task-tracking", "project-management", "control-freaks"]
---

# ✅ Task Kanban – Control Freaks Puppet Project

This `README.md` explains the structure, usage, and conventions of the **Tasks Kanban Board** used to manage all project tasks across the four major phases of the *Control Freaks Puppet Project*.

---

## 🗂️ What is This?

The **Tasks Kanban** is an interactive task tracker embedded in Obsidian using the `kanban-plugin`. It references every project task using structured **Task IDs**, supports live task tracking, and links to individual task markdown files.

This board allows you to:
- Track task progress (Not Started / In Progress / Completed)
- Jump directly to detailed task pages
- View all project phases in one glance
- Log updates or changes with timestamps
- Align with project Milestones, Critical Path, and Timeline

---

## 🧩 Task Phases and ID Conventions

Each task belongs to a specific **project phase** and is labeled using a phase-specific Task ID prefix:

| Phase | Prefix | Description |
|-------|--------|-------------|
| Controller Development | `CD-T##` | Tasks for PCB design, electronics, and firmware |
| Puppet Development | `PD-T##` | Tasks for puppet structure, printing, and mechanical assembly |
| Show Pipeline | `SP-T##` | Tasks for storytelling, filming, and editing |
| Vault Integration | `OV-T##` | Tasks for archiving, PARA folder structuring, and documentation |

---

## 🗃️ Board Columns and Their Purpose

Each Kanban "card" (column) serves a distinct role in managing the project:

1. ### 📌 Notes & Comments  
   - Temporary ideas, feedback, or unprocessed observations.
   - Used for general commentary or placeholder ideas.
   - Tasks here are not formally defined.

2. ### 🧾 Task Register  
   - Primary index of all project tasks.
   - Organized into four phase-based subsections:
     - 🧠 Controller Development (`CD-T##`)
     - 🎭 Puppet Development (`PD-T##`)
     - 🎬 Show Pipeline (`SP-T##`)
     - 🗂️ Vault Integration (`OV-T##`)
   - Each entry links to a full task note.

3. ### 🧠 Controller Development (`CD-T##`)  
   - Focuses on electronic design and firmware writing.
   - Begins with schematics and ends with servo motion tests.

4. ### 🎭 Puppet Development (`PD-T##`)  
   - Physical build process: design, 3D modeling, print, assembly, and servo installation.

5. ### 🎬 Show Pipeline (`SP-T##`)  
   - Covers content creation, scene recording, and postproduction.

6. ### 🗂️ Vault Integration (`OV-T##`)  
   - Documents and archives project artifacts into PARA folders.
   - Includes MOCs, summary reports, and lessons learned.

7. ### 🔁 Task Update Log  
   - Logs batch file creation, status changes, and structural edits.
   - Maintains traceability and accountability for solo development.

8. ### 📊 Task Metadata  
   - Houses universal values such as:
     - Status: `"not started"`, `"in progress"`, `"completed"`
     - Priority: `"High"`, `"Medium"`, `"Low"`
     - Tags and references
   - Useful for setting search filters or template consistency.

9. ### 📎 Related Docs  
   - Cross-references key documents:
     - Tasks and Activities Breakdown
     - Project Timeline
     - Critical Path
     - Milestones
     - Progress Tracking Notes

---

## 🛠️ How to Use This Kanban

### ✅ View Task Status
Each task is marked with a checkbox:
- `[ ]` Not Started
- `[-]` In Progress
- `[x]` Completed  
Update these weekly as part of the Sunday review.

### 🔗 Navigate to Task Notes
Click the linked task ID (e.g., `[[CD-T01]]`) to view the full note:
- Contains YAML metadata
- Task description and dependencies
- Duration, progress, risk, and status info

### 🕑 Weekly Reviews
Update status each Sunday night after:
- Reviewing blockers and delays
- Logging changes to task notes
- Aligning with updated Milestone or Timeline files

---

## 🔄 Using the Task Update Log

Use the `🔁 Task Update Log` column to:
- Timestamp new task creations
- Note when major task batches are finalized
- Maintain an audit trail of development activity

Example:
- `2025-06-13`: Exported all `CD-T##` tasks
- `2025-06-14`: Begin drafting `PD-T##` tasks

---

## 📎 Related Documents

This Kanban board is cross-linked with the following project documents:

- [[Tasks and Activities Breakdown]]
- [[Project Timeline]]
- [[Critical Path Analysis]]
- [[Milestones Document]]
- [[Progress Tracking Notes]]

Ensure that changes made here are reflected in all linked documents.

---

## 📁 Location in PARA Framework

`Control Freaks Vault > Project_Management > Tasks > README.md`
