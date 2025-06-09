# 🧠 8‑Bit Computer Capstone Project

A handcrafted, modular 8‑bit computer built using TTL logic ICs — inspired by Ben Eater’s architecture — developed as part of an academic engineering capstone. This repository includes all project documentation, build instructions, diagrams, and supporting references.

![Gantt Chart](assets/gantt-chart.jpg)

---

## 🎯 Project Objective

To design, build, and validate a fully functional 8‑bit CPU using only discrete components (no microcontrollers). The computer executes simple programs by coordinating a clock, registers, program counter, ALU, memory, and control logic — all built from the ground up using 74LS-series logic chips on a breadboard.

This project demonstrates core competencies in:
- Digital logic and microarchitecture
- Circuit analysis and prototyping
- Hardware timing and clock signal management
- Technical documentation and engineering process

---

## 🧩 Core Features

- ✅ **Modular Hardware Design**: Includes ALU, Program Counter, Registers, Clock, Instruction Decoder, RAM, and ROM
- 🧠 **TTL Logic Only**: Built entirely from 74LS-series integrated circuits
- 🧪 **Step-by-Step Testing**: Debugged and validated one module at a time
- 📄 **Complete Documentation**: Includes project charter, Gantt chart, ELTR course overview, and learning resources
- 🛠️ **No Programming Required**: Machine code is programmed into EEPROM manually

---

## 📁 Folder Structure

```plaintext
8-Bit-Computer-Capstone/
├── docs/               # Project documents, reports, and guides
│   ├── ELTR-Course-Overview.docx
│   ├── Project-Charter.docx
│   └── Getting-Started.pdf
├── assets/             # Project visuals, diagrams, and media
│   └── gantt-chart.jpg
├── src/                # Logic circuit schematics, breadboard layouts
│   ├── logic-circuits/
│   └── breadboard-layouts/
├── references/         # External datasheets and technical references
│   └── Data Sheets.zip
├── notes/              # Markdown notes and file planning
│   ├── Ben Eater's 8-bit Project.md
│   └── file setup.txt
├── .gitignore
├── LICENSE
└── README.md
