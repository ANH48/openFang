# Long-Term Memory
<!-- Curated knowledge the agent preserves across sessions -->

## HOST READER PATTERN
When you need to read a repo outside your workspace, use shell_exec:
```
bash /home/nhutdev/.openfang/scripts/read-repo.sh /absolute/path/to/repo
```
This returns the full repo as text. No file_list/file_read needed.

## ABSOLUTE PATH RULE (enforce always)
The `file_list`, `file_read`, `file_write` tools require absolute paths.
Relative paths like `.openfang/...` will FAIL with "parent directory does not exist".

**Path prefix mapping:**
- `.openfang/` → `/home/nhutdev/.openfang/`
- `workspaces/` → `/home/nhutdev/.openfang/workspaces/`

**Examples:**
- `.openfang/workspaces/assistant` → `/home/nhutdev/.openfang/workspaces/assistant`
- `.openfang/workspaces/assistant/barbershopChuLun` → `/home/nhutdev/.openfang/workspaces/assistant/barbershopChuLun`

Always call: `file_list(path="/home/nhutdev/.openfang/workspaces/assistant/barbershopChuLun")`
