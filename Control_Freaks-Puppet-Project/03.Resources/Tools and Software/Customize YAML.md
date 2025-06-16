---
title: "Customizing YAML for Dataview Queries"
date: 2025-01-09
tags: ["YAML", "customization", "Dataview"]
summary: "A structured approach to customizing YAML headers for compatibility with Dataview queries, including core and dynamic fields based on file type."
author: "Thomas Ware"
type: "guideline"
status: "Ongoing"
priority: "High"
allocated_to: "Knowledge Management Team"
---
To ensure all YAML headers meet the core requirements and accommodate specific Dataview queries for different file types, we can follow a **structured, adaptive approach**:

### Core YAML Fields

Include mandatory fields that apply universally to all documents, ensuring compatibility with Dataview:

- **title**: The document's title.
- **date**: Creation or last modified date (if needed).
- **tags**: Keywords for categorization.
- **summary**: A brief description of the document's purpose or content.
- **author**: Name of the creator (e.g., "Thomas Ware").
- **type**: Specify the document type (e.g., "template", "resource log", "area overview").

### Dynamic Fields for Dataview Queries

In addition to the core fields, add **context-specific fields** depending on the file's role or requirements. These fields will provide additional metadata for more detailed Dataview queries:

#### 1. **Resource Logs**

```yaml
project: [Project Name]
status: [Available/In Use/Archived]
resource_type: [Material/Tool/Human]
allocated_to: [Task/Process]
```

#### 2. **Task Lists**

```yaml
deadline: [YYYY-MM-DD]
priority: [High/Medium/Low]
assigned_to: [Team Member Name]
status: [Pending/In Progress/Completed]
```

#### 3. **Area Management**

```yaml
area: [Personal Development/Operations/Learning]
current_initiatives:
  - Initiative 1
  - Initiative 2
review_frequency: [Weekly/Monthly/Quarterly]
```

#### 4. **Archiving Logs**

```yaml
archived_date: [YYYY-MM-DD]
archived_by: [User Name]
rationale: [Reason for Archiving]
location: [Folder Path]
```

### Implementation Plan

1. **Create a YAML Template**:
    
    - Define a **base YAML template** with the mandatory fields.
    - Use conditional logic (in manual edits or templater plugins) to add dynamic fields based on file type.
2. **Automate Field Selection**:
    
    - Use Obsidian's **Templater Plugin** or **Scripts**:
        - Include logic to determine file type and inject the appropriate dynamic fields.
        - For example:
            
            ```yaml
            
            ```
            
3. **Set Up Folder-Specific Templates**:
    
    - Assign unique templates to different folders or file types (e.g., Resource Logs, Task Lists) using **Templater** or Obsidian's **Template Core Plugin**.
    - Ensure every template inherits the core YAML fields and adds type-specific ones.
4. **Maintain Consistency**:
    
    - Use Dataview's default fields (like `tags` and `type`) for universal querying.
    - Use type-specific fields for granular filtering (e.g., `status = "In Progress"` or `area = "Learning"`).

Would you like me to help create a comprehensive YAML template for these scenarios or suggest specific Dataview queries for your use case?