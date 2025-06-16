---
title: "Checklist: Pre-Rendering"
date: 2025-01-08
date_last_modified: 2025-01-09
tags: ["checklist", "rendering", "3D puppet design"]
summary: "A pre-rendering checklist for the 3D Puppet Design project, covering scene preparation, rendering settings, and animation checks to ensure high-quality outputs."
author: "Thomas Ware"
type: "checklist"
project: "3D Puppet Design"
status: "Completed"
priority: "High"
allocated_to: "Rendering Team"
---
# **Checklist: Pre-Rendering**

## **Project:** 3D Puppet Design

---

## **1. Overview**
This checklist ensures all necessary steps are completed before initiating the rendering process for the **3D Puppet Design** project. Proper preparation enhances output quality and minimizes rework.

---

## **2. Pre-Rendering Checklist**

### **A. Scene Preparation**
1. **Model Validation:**
   - Confirm all models are free of geometry issues (e.g., non-manifold edges, flipped normals).
   - Ensure materials and textures are correctly assigned.
2. **Lighting Setup:**
   - Place key, fill, and rim lights to highlight the puppet.
   - Check for proper exposure and shadow accuracy.
3. **Camera Placement:**
   - Verify framing and focal length.
   - Adjust depth of field for desired focus and bokeh effects.

### **B. Rendering Settings**
1. **Resolution:**
   - Set output resolution (e.g., 1920x1080 for HD or higher for 4K).
2. **Samples:**
   - Increase sampling for smoother results (e.g., 128–256 samples for final renders).
3. **Render Engine:**
   - Choose the appropriate render engine (e.g., Cycles, Eevee).
4. **Output Format:**
   - Select preferred output format (e.g., PNG, EXR) and compression settings.

### **C. Materials and Textures**
1. **Texture Resolution:**
   - Use high-resolution textures to prevent pixelation.
   - Ensure all texture paths are relative and accessible.
2. **Material Shading:**
   - Check material nodes for correct settings (e.g., subsurface scattering for skin).
   - Preview materials in rendered view to confirm accuracy.

### **D. Animation Checks (if applicable)**
1. **Keyframe Review:**
   - Ensure all keyframes are accurate and transitions are smooth.
2. **Physics Simulation:**
   - Bake simulations for cloth, hair, or particle effects to avoid inconsistencies.
3. **Timing:**
   - Verify animation timing matches project requirements.

### **E. Environment Setup**
1. **Backgrounds:**
   - Use HDRIs or custom backgrounds for realistic lighting.
2. **Scene Elements:**
   - Remove unused assets to optimize render times.
   - Ensure all props are correctly placed and scaled.

### **F. Final Checks**
1. **Preview Renders:**
   - Render a low-sample preview to identify issues.
   - Confirm composition and color balance.
2. **System Resources:**
   - Check available RAM and GPU usage.
   - Close unnecessary applications to allocate resources.

---

## **3. Notes and Best Practices**
- Save incremental versions of the project file before rendering.
- Regularly test renders at lower resolutions to minimize troubleshooting time.
- Document any rendering issues and solutions for future reference.

---

**Prepared by:** [Your Name]  
**Date:** [Insert Date]
