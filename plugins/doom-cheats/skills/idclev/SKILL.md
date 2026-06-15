---
name: idclev
description: >-
  IDCLEV — "level warp." Jump straight to the target: the user gives a target (a
  file, function, symbol, feature area, error message), this locates it fast
  (Grep/Glob), opens it, orients briefly, and IMMEDIATELY continues the requested
  action there — skipping the hunt. Use when the user types /idclev, or says "warp
  to", "take me to X", "jump straight to", "where is X and fix it", or in Hungarian
  "ugorj a", "vigyél a ...-hez", "menjünk egyből a", "hol van a ... és javítsd" —
  and when work needs to happen at a specific named location and long navigation is
  wasted.
---

# IDCLEV — Level Warp 🚀

> *Doom: IDCLEVxx = you jump straight to the chosen level.*
> Here: the user has no time to hunt — warp straight to the target and start the
> work there.

The point is SPEED: we're not doing recon (that's `/iddt`), we teleport to a known
target and act immediately.

## The warp

### 1. 🎯 The target coordinate
What's the target? A filename, a function/class name, a symbol, a snippet, an error
message, or a feature area. If the user gave it, that's the target. If it's vague
(multiple matches possible), clarify in one sentence — don't warp blind.

### 2. 🔍 Locate — fast
Find it with the most efficient tool:
- symbol/text → **Grep**,
- filename pattern → **Glob**,
- "somewhere it does X" → if the location is uncertain, an **Explore** subagent.
Don't read unnecessarily — aim, don't sweep.

> 🦷 **Teeth — no guessed warp allowed.** NEVER edit a file/line you haven't
> confirmed as a hit via a real Grep/Glob/Read call. The warp is fast but not
> blind: the tool confirms the `file:line` coordinate first, and only then comes
> step 4's action. If the search returns 0 or too many hits, that's not a warp
> target — clarify with the user in one sentence, don't jump to an uncertain spot.

### 3. 📍 Land + brief orientation
Open the target and look around only enough to do the action safely (the immediate
context: the function, the call sites if needed).

### 4. ⚡ Immediate action
Do the requested action THERE, don't go back for permission unless the change is
risky or ambiguous. If it is, stop there.

## Readout (brief)

```
🚀 WARP → <file:line / symbol>
   <what you found in one sentence, and what you're doing now>
```

## If the landing is dangerous
If the action at the target is hard to reverse (mass rewrite, delete), warp there,
but before the change switch to god mode (`/iddqd`) — restore point first, then cut.
