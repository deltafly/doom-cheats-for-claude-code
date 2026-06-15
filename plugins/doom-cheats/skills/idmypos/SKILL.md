---
name: idmypos
description: >-
  IDMYPOS — "show coordinates." An orientation / status mode: a fast, cheap status
  report of where you are RIGHT NOW — working directory, git state (if any), which
  task you're on, what's been done this session, and the next step. It runs a
  bundled read-only script for the real git/dir data and fills the rest from session
  context and relevant memory, printing a compact "POSITION" readout. Use when the
  user types /idmypos, or asks "where are we", "what's the state", "what have we
  done", "where are we now", "status", or in Hungarian "hol tartunk", "mi a
  helyzet", "mit csináltunk eddig", "merre járunk" — and when you need to re-orient
  during a long task.
---

# IDMYPOS — Show Position 🧭

> *Doom: IDMYPOS = it prints your coordinates on the map.*
> Here: a fast status report of where you stand — so during a long task or after a
> break you can reconnect in seconds.

This is a CHEAP mode: it doesn't work, doesn't modify, it just shows the state.
Don't overdo it — a few scannable lines is the goal, not a report.

## Teeth: run the script for the "where"
Don't guess the location/git state — the skill bundles a deterministic read-only
script that pulls real data (branch, uncommitted file count, last commit, upstream
distance, or for a non-git folder the most recently modified files). Run it from
this skill's base directory:

```
& "<skill-dir>\scripts\position.ps1"
```

The script gives the "Where" line factually; you fill the Task/Done/Next/Block
lines from session context and relevant memory. *(Non-Windows: `git status -sb` +
`git log -1 --oneline` by hand.)*

## What to gather
Only what's needed to orient:
1. **Where:** working dir; if a git repo, current branch + whether there are
   uncommitted changes (briefly). If not a repo, just the directory.
2. **Task:** the current task / mission this session.
3. **Done:** what's been done so far — the important steps, not every detail.
4. **Next:** the next step(s), open questions, blockers.
5. **Context:** if relevant, the project's current status from memory (but only if
   it actually belongs here).

## Readout — POSITION

```
═══ POSITION ═══
📂 Where: <dir  ·  branch / state, if any>
🎯 Task:  <what we're working on now>
✅ Done:  <the main steps completed>
⏭️ Next:  <next step / open question>
🚧 Block: <any obstacle; else "—">
════════════════
```

After the readout, stop — this is orientation, not action. The user decides where
next (and can call another cheat, e.g. `/idclev` to warp or `/idclip` if we're stuck).
