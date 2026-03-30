# Tools & Environment
<!-- Agent-specific environment notes (not synced) -->

## PATH RULE (CRITICAL)
- ALWAYS use absolute paths for ALL tools (file_read, file_write, file_list, shell_exec).
- NEVER pass relative paths like `.openfang/...` to any tool.
- Workspace root: `/home/nhutdev`
- Openfang root: `/home/nhutdev/.openfang`
- All workspaces: `/home/nhutdev/.openfang/workspaces/`

### Common absolute paths
| Relative | Absolute |
|---|---|
| `.openfang/workspaces/assistant` | `/home/nhutdev/.openfang/workspaces/assistant` |
| `.openfang/workspaces/assistant/barbershopChuLun` | `/home/nhutdev/.openfang/workspaces/assistant/barbershopChuLun` |

If a user gives you a relative path starting with `.openfang/`, prepend `/home/nhutdev/` to make it absolute before calling any tool.
