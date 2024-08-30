---
title: "Task [ID or Name]"
date: "YYYY-MM-DD"  # Date of task creation or last update
project: "Project Name"
status: "not started"  # Options: not started, in progress, completed, on hold
priority: "High/Medium/Low"
tags: ["task", "project-specific-tag"]
---

---
# Tasks - Note

**Note:** Update the YAML Front Matter and task details regularly to reflect the current status and changes.

---
Here's a template for managing tasks and notes with an emphasis on regularly updating the YAML Front Matter and task details to reflect the current status and any changes:

---

## **Tasks - Note Template**

```yaml
---
# YAML Front Matter
task_id: [Unique Task ID]
task_name: [Task Name]
owner: [Task Owner]
status: [Not Started | In Progress | Completed | On Hold]
priority: [Low | Medium | High]
start_date: [YYYY-MM-DD]
due_date: [YYYY-MM-DD]
last_updated: [YYYY-MM-DD]
dependencies: [List of dependencies, if any]
tags: [Optional tags, e.g., #design, #development]
---

```

---

### **Task Overview**

**Task Name:**  
- **Task ID:** [Unique Task ID]  
- **Owner:** [Task Owner]  
- **Priority:** [Low | Medium | High]  
- **Status:** [Not Started | In Progress | Completed | On Hold]  
- **Start Date:** [YYYY-MM-DD]  
- **Due Date:** [YYYY-MM-DD]  
- **Last Updated:** [YYYY-MM-DD]  
- **Dependencies:** [List any dependencies, e.g., other tasks or milestones]

---

### **Task Description**

Provide a detailed description of the task, including its objectives, deliverables, and any relevant details or instructions.

---

### **Subtasks**

List any subtasks required to complete the main task. Include details such as the owner, start and due dates, and current status.

- **Subtask 1:**  
  - **Owner:** [Subtask Owner]  
  - **Status:** [Not Started | In Progress | Completed]  
  - **Start Date:** [YYYY-MM-DD]  
  - **Due Date:** [YYYY-MM-DD]  
  - **Notes:** [Any relevant notes about this subtask]

- **Subtask 2:**  
  - **Owner:** [Subtask Owner]  
  - **Status:** [Not Started | In Progress | Completed]  
  - **Start Date:** [YYYY-MM-DD]  
  - **Due Date:** [YYYY-MM-DD]  
  - **Notes:** [Any relevant notes about this subtask]

(Continue for additional subtasks as needed.)

---

### **Progress Updates**

Document any progress updates, decisions, or changes related to the task. Include the date of each update and details of what was done or decided.

- **[YYYY-MM-DD]**: [Update details, e.g., "Task moved to In Progress, started development."]  
- **[YYYY-MM-DD]**: [Update details, e.g., "Reviewed design with stakeholders, awaiting feedback."]  
- **[YYYY-MM-DD]**: [Update details, e.g., "Task completed, all deliverables finalized and submitted."]

---

### **Notes and Additional Information**

Include any additional notes, references, links, or information that might be relevant to the task. This could include links to related documents, images, or other resources.

---

### **Next Steps**

Outline the next steps required to move the task forward. Specify who is responsible for each action and any deadlines associated with these steps.

- **Action 1:** [Details of the next action]  
  - **Responsible:** [Name]  
  - **Due Date:** [YYYY-MM-DD]

- **Action 2:** [Details of the next action]  
  - **Responsible:** [Name]  
  - **Due Date:** [YYYY-MM-DD]

---

**Reminder:**  
Regularly update this template, especially the YAML Front Matter and task details, to reflect the current status and any changes in scope, deadlines, or responsibilities.

---

This template is designed to help you keep track of individual tasks within a project, ensuring that all necessary details, updates, and progress are documented clearly. The YAML Front Matter at the beginning is particularly useful for maintaining structured metadata about each task, which can be easily updated as the task progresses.

---
# Applied to the Simple Calculator Project 

---
# **Tasks - Note Template: Simple Calculator Project**

```yaml
---
# YAML Front Matter
task_id: 001
task_name: Frontend Development
owner: John Doe
status: In Progress
priority: High
start_date: 2024-08-01
due_date: 2024-08-10
last_updated: 2024-08-28
dependencies: Design Completion (Task 002)
tags: #development, #frontend
---

```

---

### **Task Overview**

**Task Name:**  
- **Task ID:** 001  
- **Owner:** John Doe  
- **Priority:** High  
- **Status:** In Progress  
- **Start Date:** 2024-08-01  
- **Due Date:** 2024-08-10  
- **Last Updated:** 2024-08-28  
- **Dependencies:** Design Completion (Task 002)

---

### **Task Description**

**Objective:**  
Develop the frontend for the Simple Calculator application based on the approved design. This includes implementing the user interface (UI) elements such as buttons, display screens, and overall layout. The goal is to create a responsive, user-friendly interface that matches the design specifications.

**Deliverables:**
- Fully developed HTML structure (`index.html`).
- Applied CSS styling (`styles.css`) to match the design guidelines.
- Basic JavaScript functionality integrated to handle user interactions.

---

### **Subtasks**

- **Subtask 1: HTML Structure Development**  
  - **Owner:** John Doe  
  - **Status:** Completed  
  - **Start Date:** 2024-08-01  
  - **Due Date:** 2024-08-03  
  - **Notes:** Basic structure of the calculator layout, including the display screen and buttons.

- **Subtask 2: CSS Styling Implementation**  
  - **Owner:** John Doe  
  - **Status:** In Progress  
  - **Start Date:** 2024-08-04  
  - **Due Date:** 2024-08-06  
  - **Notes:** Ensure that the styling matches the UI design, focusing on responsiveness and accessibility.

- **Subtask 3: JavaScript Integration**  
  - **Owner:** John Doe  
  - **Status:** Not Started  
  - **Start Date:** 2024-08-07  
  - **Due Date:** 2024-08-10  
  - **Notes:** Basic functionality for user interactions (e.g., button clicks, display updates).

---

### **Progress Updates**

- **2024-08-01:** Task started, HTML structure development underway.  
- **2024-08-03:** HTML structure completed, reviewed and approved by the team.  
- **2024-08-04:** Began implementing CSS styling, focusing on layout and colors.  
- **2024-08-06:** CSS styling is 70% complete, continuing to work on responsive design.  
- **2024-08-28:** Finalizing CSS styling, preparing to start JavaScript integration.

---

### **Notes and Additional Information**

- **Design References:**  
  - The design files are located in the project’s shared drive under `Design/Simple_Calculator/UI_Mockups`.
  
- **Review Feedback:**  
  - Feedback from the UI/UX Designer suggested adjusting button spacing for better touch screen usability.

- **Related Documents:**  
  - Link to the design guidelines: [Design Guidelines Document](#)

---

### **Next Steps**

- **Action 1:** Complete CSS styling and finalize responsive design.  
  - **Responsible:** John Doe  
  - **Due Date:** 2024-08-29

- **Action 2:** Begin JavaScript integration for basic functionality.  
  - **Responsible:** John Doe  
  - **Due Date:** 2024-08-30

- **Action 3:** Conduct a review session with the UI/UX Designer to ensure all styling and functionality align with the design specifications.  
  - **Responsible:** John Doe, UI/UX Designer  
  - **Due Date:** 2024-08-31

---

**Reminder:**  
Regularly update this template, especially the YAML Front Matter and task details, to reflect the current status and any changes in scope, deadlines, or responsibilities.

---

This applied template helps manage and track the progress of the frontend development task within the Simple Calculator Project. It ensures all details are documented, progress is regularly updated, and any changes are clearly recorded.