---
title: "README – Tasks Kanban Board"
date: "2025-06-13"
project: "Control Freaks Puppet Project"
document_type: "README"
status: "active"
tags: ["kanban", "task-tracking", "project-management", "control-freaks"]
---

# ✅ Task Kanban – Control Freaks Puppet Project

This `README.md` explains the structure, usage, and conventions of the **Tasks Kanban Board** used to manage all project tasks across the four major phases of the Control Freaks Puppet Project.

---

## 🗂️ What is This?

The **Tasks Kanban** is an interactive project tracker embedded in Obsidian using the `kanban-plugin`. It lists **every single task** in the project, organized by phase and referenced by unique **Task IDs** for consistency and traceability.

This board allows you to:
- Track task progress (Not Started / In Progress / Completed)
- Jump directly to detailed task pages
- View task statuses in one glance
- Audit task changes via update logs

---

## 🧩 Project Phases and Task ID Convention

Each task is assigned a **prefix ID** that reflects its associated project phase:

| Phase | Prefix | Description |
|-------|--------|-------------|
| Controller Development | `CD-T##` | Tasks for PCB design, electronics, and firmware |
| Puppet Development | `PD-T##` | Tasks for physical puppet design and construction |
| Show Pipeline | `SP-T##` | Tasks for video production, recording, editing |
| Vault Integration | `OV-T##` | Tasks for Obsidian documentation and archival |

Each task document is stored individually and linked directly in the Kanban board.

---

## 🛠️ How to Use This Kanban

### ✅ View Task Status
Each task is marked as:
- `[ ]` Not Started
- `[-]` In Progress
- `[x]` Completed

Updates reflect live task tracking based on weekly reviews and vault logs.

### 🔗 Navigate to Task Files
Click the task link (e.g., `[[CD-T01]]`) to open the full markdown file containing:
- YAML metadata
- Description
- Dependencies
- Resources
- Notes
- Flexibility & Review Sections

### 🔁 Update Task Progress
Manually update statuses weekly (typically on **Sunday evenings**) after reviewing:
- Current progress
- Any blockers
- Delays or changes in timeline

Update the corresponding task markdown file and adjust status indicators in the Kanban.

---

## 🔄 Update Log Section

Use the **Task Update Log** section to:
- Record task file additions
- Log task revisions or restructures
- Timestamp batch updates

This helps track changes and supports traceability for solo development workflows.

---

## 📎 Related Docs

This Kanban works in concert with:
- [[Tasks and Activities Breakdown]]
- [[Project Timeline]]
- [[Critical Path Analysis]]
- [[Milestones Document]]
- [[Progress Tracking Notes]]

Each of these are required references for syncing this Kanban board with overall project documentation.

---

## 📁 Location in PARA Framework

`Control Freaks Vault > Project_Management > Tasks > README.md`
