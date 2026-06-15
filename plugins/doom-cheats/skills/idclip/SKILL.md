---
name: idclip
description: >-
  IDCLIP — "no-clip, through walls." An obstacle-bypass / anti-stuck mode: when an
  error, dependency, permission wall, or a repeatedly-failing approach blocks you,
  it systematically finds a WAY AROUND instead of headbutting the same wall. It
  names the wall, lists at least 3 alternative routes, tries the most promising, and
  keeps a ledger so it never repeats a failure. Use when the user types /idclip, or
  says "I'm stuck", "this isn't working", "find another way", "go around it",
  "workaround", or in Hungarian "elakadtam", "nem megy sehogy", "kerüld meg", "van
  rá másik út" — and proactively when the same approach fails a second or third time.
---

# IDCLIP — No-Clip 👻

> *Doom: IDCLIP = you walk through walls.*
> Here: if you're stuck behind a wall, don't headbutt it again — find a way around.
> The point is breaking the failure loop.

Most stalls last not because the problem is hard, but because we keep varying the
same failing step. No-clip steps out of that: back off, name the wall, find a
different route.

## The protocol

### 1. 👁️ Name the wall — precisely
What's blocking, exactly? The error message, the missing dependency, the
permission, the misunderstood API? If the wall is vague, illuminate it first (read
the full error, the stack trace) — you can't go around it blind.

### 2. 🚪 List at least 3 routes around
Don't fixate on the first idea. Surface several **materially different** routes,
e.g.:
- a different tool / library / approach to the same goal,
- sidestepping the problem (different order, different layer, a temporary stub),
- questioning the assumption ("do we even need this step at all?").

### 3. 🎯 Try the most promising
Pick the best odds/cost one and do it. If it also hits a wall, **don't repeat** —
back to the list for the next.

### 4. 🧱 Don't hit the same wall twice
The mode's golden rule. If a route fails the same way as before, it's no longer a
candidate. Note what didn't work and move on.

> 🦷 **Teeth — keep a real attempts ledger.** Track explicitly what you tried and
> exactly how it failed (the key line of the error). BEFORE each new attempt, check
> it against the ledger: if it's materially the same, don't run it again. This
> breaks the failure loop mechanically — not "I'll try not to repeat" but a ledger
> that forbids repetition. On a long stall, write the ledger to
> `.claude/idclip-log.md` so it survives across sessions.

## When every wall is hard
If 2-3 real routes also fail, that's a signal: maybe the goal is wrong or a piece
of info is missing. Then stop and bring it back to the user honestly — what you
tried, what's left. No-clip is smart bypassing, not infinite retrying.
