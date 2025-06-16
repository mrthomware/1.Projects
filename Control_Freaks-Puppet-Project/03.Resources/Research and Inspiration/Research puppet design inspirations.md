---
title: "Research Puppet Design Inspirations"
date: 2025-01-09
tags: ["puppet design", "research", "inspirations"]
summary: "A detailed task plan for researching puppet design inspirations, including styles, subtask breakdowns, and integration with project management workflows."
author: "Thomas Ware"
type: "task"
project: "3D Puppet Design"
status: "In Progress"
priority: "High"
allocated_to: "Research Team"
---
Here's how we can organize the **"Research Puppet Design Inspirations"** task on your Kanban board:

---

### **Task Card: Research Puppet Design Inspirations**

- **Status:** Backlog → To Do (when ready to start)
- **Assignee:** [Your Name or Assigned Team Member]
- **Due Date:** [Insert Deadline]

---

#### **Task Description**

Research and collect inspiration for the 3D puppet design. Focus on unique characteristics, styles, and use cases.

---

#### **Subtasks**

1. **Animatronic Muppet Style**
    
    - Study iconic animatronic puppets (e.g., Jim Henson's Muppets).
    - Identify key features like exaggerated expressions, fluid joint movement, and stylized textures.
    - Gather image references and video clips for inspiration.
2. **Mad Scientist Character**
    
    - Explore whimsical and outlandish designs (e.g., Gonzo meets Bunsen Honeydew and Beaker).
    - Emphasize "mad scientist" traits like oversized goggles, frizzy hair, quirky costumes, and gadgets.
    - Collect design references for exaggerated facial proportions and comedic elements.
3. **Host for YouTube Channel**
    
    - Research puppets designed for engaging video presentations.
    - Focus on expressive faces, visible articulation, and strong on-camera presence.
    - Note examples from popular YouTube channels or streaming platforms.
4. **Teaching Animatronics**
    
    - Identify puppets used in educational contexts to demonstrate animatronic principles.
    - Study designs with visible mechanisms (e.g., gears, levers) for teaching purposes.
    - Collect videos or tutorials showcasing functional teaching puppets.

---

#### **Attachments & Notes**

- Add links to images, articles, or videos for each subtask.
- Include notes on features to incorporate into the final design.

---

#### **Priority:**

High – This task will shape the creative direction for the project.

---

### **Kanban Board Integration**

- **Column:** Move to **In Progress** when research begins.
- **Review Column:** Collect feedback on the findings from stakeholders or team members.
- **Done Column:** Once all references are collected and approved, mark the task as completed.

---
Here’s an updated, comprehensive set of instructions for managing YAML headers and accommodating Dataview queries for different file types:

---

## **Instructions for Structuring YAML Headers**

### **1. Core Fields**

Ensure that every YAML header includes the following **mandatory fields** for universal compatibility:

```yaml
title: "Create mood boards"  # Automatically set to the file name
date: "2025-01-11"  # Set to the creation date
tags: [generic, universal]  # Default tags for categorization
summary: "Brief overview of the document's content and purpose."
author: "Thomas Ware"  # The document creator
type: "general"  # Specify document type (e.g., "template", "resource", "task list")
```

These fields form the foundation for querying across all files in your vault.

---

### **2. Context-Specific Fields**

For advanced Dataview compatibility, include additional metadata based on the document's type or purpose. The following dynamic fields should be added as needed:

#### **a. Resource Logs**

- Use this for tracking resources related to tasks, processes, or projects.

```yaml
project: "<Project Name>"
status: "Available"  # Options: Available, In Use, Archived
resource_type: "Material"  # Options: Material, Tool, Human
allocated_to: "<Task/Process>"
```

#### **b. Task Lists**

- Use this for managing and prioritizing tasks.

```yaml
deadline: "<YYYY-MM-DD>"  # Task due date
priority: "High"  # Options: High, Medium, Low
assigned_to: "<Team Member Name>"
status: "Pending"  # Options: Pending, In Progress, Completed
```

#### **c. Area Management**

- Use this for ongoing areas of responsibility or initiatives.

```yaml
area: "<Area Name>"  # Example: Personal Development, Operations
current_initiatives:
  - Initiative 1
  - Initiative 2
review_frequency: "Monthly"  # Review cycle (e.g., Weekly, Monthly, Quarterly)
```

#### **d. Archiving Logs**

- Use this to track archived documents or resources.

```yaml
archived_date: "<YYYY-MM-DD>"  # Date the item was archived
archived_by: "Thomas Ware"
rationale: "Reason for archiving"
location: "<Archive Path>"
```

---

### **3. Automation Plan**

#### **a. Create a Base YAML Template**

Develop a **universal template** that includes the core fields and placeholders for context-specific fields.

```yaml
---
title: "Create mood boards"
date: "2025-01-11"
tags: ["<Default Tags>"]
summary: "Summary of the file's purpose."
author: "Thomas Ware"
type: "Templates"  # Automatically set based on folder

---
```

#### **b. Folder-Specific Templates**

Set up templates specific to folders using the **Templater Plugin**:

- **Resource Templates**: Automatically add fields like `project`, `status`, and `resource_type`.
- **Task Templates**: Include `deadline`, `priority`, and `status`.
- **Area Templates**: Predefine `area` and `current_initiatives`.

#### **c. Automate Field Inclusion**

Use logic in templates to dynamically adjust fields based on file location or purpose.

---

### **4. Querying with Dataview**

Leverage Dataview for flexible queries:

- **Generic Queries** (Core Fields):
    
    ```dataview
    table title, date, summary, tags
    from ""
    where type = "general"
    ```
    
- **Specific Queries**:
    - **Resources**:
        
        ```dataview
        table project, status, resource_type, allocated_to
        from "Resources"
        where status = "Available"
        ```
        
    - **Tasks**:
        
        ```dataview
        table title, deadline, priority, status
        from "Tasks"
        where status != "Completed"
        sort deadline asc
        ```
        
    - **Areas**:
        
        ```dataview
        table area, current_initiatives, review_frequency
        from "Areas"
        ```
        

---

### **5. Maintenance**

- **Review Templates Regularly**: Update folder templates to align with evolving needs.
- **Standardize Tags**: Ensure consistent tagging conventions across all files for better query results.
- **Audit YAML Fields**: Periodically review YAML headers for missing or outdated fields.

Would you like me to draft sample folder-specific templates based on this updated framework?