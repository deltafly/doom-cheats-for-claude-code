---
name: idbehold
description: >-
  IDBEHOLD — "power-up menu." The central menu of the DOOM pack: it lists all the
  Doom-themed cheat skills and what each does, like the in-game power-up selector.
  Pure reference/menu, it does no work. Use when the user types /idbehold, or asks
  "what cheats do I have", "show the doom pack", "list the doom skills", "what can
  the cheats do", "doom menu", or in Hungarian "milyen cheatek vannak", "mutasd a
  doom packot", "mik a doom skillek" — and when the user doesn't know which Doom
  mode to call for a situation.
---

# IDBEHOLD — Power-Up Menu 🎮

> *Doom: IDBEHOLD = brings up the power-up selector (V/S/I/R/A/L).*
> Here: the DOOM pack's menu — every cheat in one place, what it does, and when to
> call it. This mode doesn't work, it just directs.

When this triggers, print the menu (adapted to the installed skills — if one is
missing or a new one was added, update the list accordingly), and if the user
described a situation, recommend the matching cheat.

## The DOOM-PACK menu

```
╔════════════════ DOOM PACK ════════════════╗
║  /iddqd    🛡️  GOD MODE                     ║
║            restore point → work → hard verify║
║            (risky / hard-to-reverse change) ║
║                                            ║
║  /idkfa    🔫  ALL WEAPONS                  ║
║            arsenal survey + arm up         ║
║            (start of a complex task)       ║
║                                            ║
║  /iddt     🗺️  AUTOMAP                      ║
║            codebase recon, structure       ║
║            (unknown repo, "where do I start")║
║                                            ║
║  /idclip   👻  NO-CLIP                       ║
║            stuck → route around, anti-stuck║
║            (nothing works, workaround)     ║
║                                            ║
║  /idclev   🚀  LEVEL WARP                   ║
║            jump to the target + act        ║
║            (known file/function, fast)     ║
║                                            ║
║  /idmypos  🧭  SHOW POS                      ║
║            where we are, status readout    ║
║            (orientation, "what's the state")║
║                                            ║
║  /idbehold 🎮  ← you are here (this menu)    ║
╚════════════════════════════════════════════╝
```

## Situation → cheat picker
If the user describes a situation, match it:
- "a big/risky rewrite is coming" → **/iddqd**
- "I'm starting a complex task" → **/idkfa**
- "I don't know this code" → **/iddt**
- "I'm stuck, nothing works" → **/idclip**
- "take me to the X file/function" → **/idclev**
- "where are we at?" → **/idmypos**

After the menu, don't start working — the user picks, or calls the right mode.
