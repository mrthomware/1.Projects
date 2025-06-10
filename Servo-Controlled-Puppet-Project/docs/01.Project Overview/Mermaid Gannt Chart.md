```mermaid
gantt
    title Project Timeline
    dateFormat  YYYY-MM-DD

    section Controller Dev
    Circuit Design        :done, c1, 2025-06-10, 8d
    Firmware Development  :active, c2, after c1, 7d
    Sync Demo             :c3, after c2, 7d

    section Puppet Dev
    Shell + Servo Layout  :p1, 2025-07-03, 7d
    Motion Testing        :p2, after p1, 8d
    Final Assembly        :p3, after p2, 6d

    section YouTube Dev
    Script + Storyboard   :y1, 2025-07-25, 2d
    Filming & Editing     :y2, after y1, 4d
    Publish & Review      :y3, after y2, 3d
```
