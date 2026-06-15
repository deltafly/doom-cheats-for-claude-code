---
name: idkfa
description: >-
  IDKFA — "all weapons, full ammo, all keys." An arm-up / equip mode before a big
  task: it surveys the available arsenal (skills, MCP connectors, tools), flags
  missing keys (auth), pulls in the relevant memory/project context, then goes in
  at full capacity. Use when the user types /idkfa, or asks to "arm up", "load
  everything", "what tools do you have for this", "prep everything for this", or in
  Hungarian "fegyverkezz fel", "full arzenál", "készíts elő mindent ehhez", "milyen
  eszközöd van erre" — and generally at the start of any complex task where it's
  worth taking stock of the full toolkit before diving in.
---

# IDKFA — Arsenal Mode 🔫

> *Doom: IDKFA = all weapons, full ammo, all keys.*
> Here: before you dive into the work, take stock and arm up — so you attack the
> task at full capability, not one-handed.

The point is NOT to load everything into context (that's just noise and burned
tokens). The point is to consciously pick up the FULL arsenal relevant to the
mission, and to surface what's missing (locked doors, missing keys) before you get
stuck halfway.

## Clarify the mission
First know what you're arming for. If the user gave the task after `/idkfa`, that's
the mission. If it's empty or vague, ask ONE short question — don't interrogate.

## Survey the arsenal — 4 steps
Work through these four, then print the readout. Keep it TARGETED: hunt the tools
that fit the mission, not all of them.

> 🦷 **Teeth:** actually DO these, don't just claim them. For "Weapons" make real
> `ToolSearch` call(s) on the mission keywords; for "Ammo" actually `Read` the
> relevant memory files (the `MEMORY.md` index first). The readout may only go out
> AFTER the sweep and load happened — otherwise it's empty theater, exactly the
> "just a prompt" weakness we avoid.

### 1. 🔫 Weapons — what capabilities fit
- Scan available **skills** for ones that directly fit (e.g. `/code-review`,
  `/verify` for code; `/council` for decisions; `/deep-research` for research).
  Surface only the relevant ones.
- Search for **MCP connectors / tools** with `ToolSearch` on the mission keywords
  (e.g. "slack", "drive", "calendar", "browser"). Don't guess they exist — search.

### 2. 🗝️ Keys — what's locked (auth)
- Among the connectors found, flag which are **not yet authenticated** or may
  prompt for login. Those are the locked doors — better to know now.
- If a key is missing, say exactly what the user needs to open.

### 3. 🎯 Ammo — pull in context
- Pull the **memory** relevant to the mission: scan the `MEMORY.md` index and read
  the memory files that bear on the task.
- Take stock of the relevant **project docs / code** (the relevant folder, entry
  points) — only as much as the mission needs, not the whole repo.

### 4. 📋 Readout — print the ARSENAL
Give a compact, scannable loadout, NOT an essay:

```
═══ ARSENAL LOADED ═══
🎯 Mission: <one line>
🔫 Weapons: <relevant skills/tools, comma-separated>
🗝️ Keys:    <ready ✅ / MISSING ⚠️ — what to auth>
🎯 Ammo:    <memory + context loaded, briefly>
⚡ Missing: <if something is needed but absent; else "—">
══════════════════════
```

## Then: attack
After the readout, don't wait for permission unless a missing key blocks you — go
in at full capacity. If a key is missing and you can't proceed without it, stop
there and ask the user.

## Restraint
"Full ammo" here means RELEVANT ammo, not all of it. For a frontend bugfix, don't
sweep the sales connectors. A good arsenal is targeted: just enough firepower for
the mission, plus awareness of what's missing.
