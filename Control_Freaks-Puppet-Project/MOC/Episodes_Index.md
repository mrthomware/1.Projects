# 🎞️ Episodes Index

List of all episodes and their statuses.

```dataview
table release_target, status, puppet_used
from "Projects/Episode_Production"
where contains(tags, "#episode")
```