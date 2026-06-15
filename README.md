# 💀 DOOM Pack — cheat codes for Claude Code

> *IDDQD. IDKFA. The cheats you typed at 2 AM in 1993 — now in your terminal.*

Seven classic **DOOM cheat codes**, each mapped to a real Claude Code workflow
mode. Not gimmicks: every cheat has **teeth** — it runs an actual script or a
required tool action, not just a prompt.

```
╔════════════════ DOOM PACK ════════════════╗
║  /iddqd    🛡️  GOD MODE     restore point → work → hard verify ║
║  /idkfa    🔫  ALL WEAPONS  survey tools/memory, arm up        ║
║  /iddt     🗺️  AUTOMAP      codebase recon + cached map        ║
║  /idclip   👻  NO-CLIP      stuck → route around (attempt log) ║
║  /idclev   🚀  LEVEL WARP   jump to a verified file:line + act ║
║  /idmypos  🧭  SHOW POS     real git/dir status readout        ║
║  /idbehold 🎮  MENU         the pack menu + situation picker   ║
╚════════════════════════════════════════════╝
```

## Install

```
/plugin marketplace add deltafly/doom-cheats-for-claude-code
/plugin install doom-cheats@doom-pack
```

Then type any cheat, e.g. `/iddqd` before a risky change, or `/idbehold` to see
the menu. The cheats also trigger from natural language ("I'm stuck", "make this
bulletproof", "where are we") — in **English and Hungarian**.

## What each one actually does

| Cheat | Doom meaning | Claude Code mode |
|-------|--------------|------------------|
| **`/iddqd`** | god mode / invincibility | Makes a **real restore point** (`git stash create` snapshot or `.bak`) → does the work → **hard verification** (tests, run the app, adversarial diff review) → honest verdict + rollback offer. |
| **`/idkfa`** | all weapons, full ammo, keys | **Arms up** for a task: real `ToolSearch` sweep for skills/MCP connectors, flags missing auth ("keys"), loads relevant memory/context, then goes in at full capacity. |
| **`/iddt`** | full automap reveal | **Recon** of an unknown codebase: stack, entry points, modules, data flow — runs `Explore` subagents and **caches** the map to `.claude/iddt-map.md`. |
| **`/idclip`** | no-clip, through walls | **Anti-stuck**: names the wall, lists ≥3 alternative routes, keeps an **attempt ledger** that mechanically forbids repeating a failed approach. |
| **`/idclev`** | level warp | **Jump to a target** (file/function/symbol), locate it fast — **no guessed edits**, only a Grep/Glob/Read-confirmed `file:line` — then act immediately. |
| **`/idmypos`** | show coordinates | **Status readout**: runs a read-only script for real git/dir state, fills task/done/next from context. |
| **`/idbehold`** | power-up menu | The **pack menu** + a "situation → cheat" picker. |

## The teeth (why this isn't just prompts)

- `/iddqd` and `/idmypos` bundle real PowerShell scripts (`scripts/restore-point.ps1`,
  `scripts/position.ps1`) — they *do* the deterministic part, they don't describe it.
- `/idkfa`, `/iddt`, `/idclip`, `/idclev` enforce a real tool action (ToolSearch /
  Explore / Grep / a written ledger) before any readout — no empty theater.

> **Note:** the bundled scripts are PowerShell (Windows-first). On macOS/Linux the
> skills fall back to the equivalent by hand (`git stash create` + note HEAD;
> `git status -sb`). A bash port is welcome — PRs open.

## Compose them

They chain naturally:

- `/idkfa` to arm up → build → `/iddqd` before you ship.
- `/idclev` to warp to the target → if the change is dangerous, `/iddqd` first.
- Lost? `/idmypos`. Stuck? `/idclip`. New repo? `/iddt`.

## Author

**Molnár Barna** — [LinkedIn](https://www.linkedin.com/in/barna-moln%C3%A1r-01b7b41b0/)

## License

MIT — see [LICENSE](LICENSE). Use it, fork it, port it. 🤘
