---
name: iddqd
description: >-
  IDDQD — "god mode" / invincibility. A bulletproof safety-harness mode for risky
  or hard-to-reverse work: it FIRST creates a real restore point (runs a bundled
  script — git stash-create snapshot, or a timestamped .bak), ONLY THEN touches
  anything, then verifies hard (tests, running the app, adversarial self-review of
  the diff), and only calls it done after verification — on failure it says so
  honestly and offers a rollback. Use when the user types /iddqd, or asks to "make
  this bulletproof", "god mode", "don't let it break", "safety net", "add a guard",
  or in Hungarian "csináld golyóállóra", "nehogy eltörjön", "biztonsági háló", "ne
  basszunk el semmit" — and proactively before any dangerous, wide-reaching or
  hard-to-reverse change (mass file edits, migrations, deletes, build/deploy config).
---

# IDDQD — God Mode 🛡️

> *Doom: IDDQD = invincibility. You cannot die.*
> Here: we wrap risky work in armor, so that if something goes wrong you can step
> back unharmed.

God mode is NOT recklessness and NOT skipping checks — the opposite. You're
invincible because (1) there is a way back, and (2) you verify before declaring
done. Those are the two plates of the armor.

## The protocol — order matters

### 1. 🛡️ Restore point FIRST — run the script, don't just promise
This is the soul of the mode and its teeth: don't *promise* a restore point —
*make* one. The skill bundles a deterministic script at `scripts/restore-point.ps1`
(run it from this skill's base directory).

- **Working on a repo / code:** run it with no arguments. In a git repo it takes a
  `git stash create` snapshot of the working tree WITHOUT touching anything, and
  prints the exact `git reset --hard <hash>` rollback command:
  ```
  & "<skill-dir>\scripts\restore-point.ps1"
  ```
- **Non-git folder, editing specific files:** pass them — it makes a timestamped
  `.bak` of each:
  ```
  & "<skill-dir>\scripts\restore-point.ps1" "path\file1" "path\file2"
  ```
- **Quote the rollback command back** to the user from the script's output — that's
  the contract that the next step is safe.
- *(Non-Windows / no PowerShell: do the same by hand — `git stash create` + note
  HEAD, or `cp file file.bak`.)*

### 2. ⚙️ The work — carefully
Now make the change. With a restore point you can work boldly, but not sloppily:
small steps, a reviewable diff.

### 3. 🎯 Hard verification — don't believe it, check it
The other plate of the armor. Don't say done until you've run:
- **Tests:** run the relevant tests. If there's no coverage for the area, say so
  honestly — that itself is a risk signal.
- **Run the app / command:** where it makes sense, actually run the code and
  OBSERVE the behavior, not just that it compiles.
- **Adversarial self-review:** re-read your own diff as a skeptical reviewer
  hunting for bugs — edge cases, missed call sites, side effects.

### 4. ✅ Verdict — honestly
- **All green:** state factually what you verified and how. Don't hedge when it's
  actually done.
- **Something failed:** do NOT paper over it. Say exactly what broke, show the
  output, and offer the rollback to step 1's restore point.

## Readout template

```
═══ GOD MODE ═══
🛡️ Restore: <commit-hash / stash / .bak path>
⚙️ Change:  <one line: what you did>
🎯 Verify:
   tests   → <pass/fail/n.a.>
   run     → <what you observed>
   review  → <what you checked, what you found>
✅ Verdict: <DONE and verified  /  FAILED + rollback offer>
════════════════
```

## When proactively
If the user didn't type /iddqd but the task is hard to reverse (mass rewrites,
schema migration, deleting files/data, touching build or deploy config), offer or
start this mode — the restore point is cheap, the mistake is expensive.
