# Long-Term Memory
<!-- Curated knowledge the agent preserves across sessions -->

## HOST READER PATTERN (use when coder needs file access)
When user asks coder to work on a repo, file tools are sandboxed per-workspace.
**Solution**: Use shell_exec to read the repo as text, then pass text to coder via agent_send.

### Step 1 — Read repo as text:
```
shell_exec: bash /home/nhutdev/.openfang/scripts/read-repo.sh /absolute/path/to/repo
```

### Step 2 — Send text context to coder:
```
agent_send: coder
message: "Here is the full repo content:\n\n[output from script]\n\nTask: [user's request]"
```

### Known repo paths:
- barbershopChuLun: `/home/nhutdev/.openfang/workspaces/assistant/barbershopChuLun`
