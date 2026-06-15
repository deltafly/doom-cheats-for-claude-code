---
name: iddt
description: >-
  IDDT — "full automap reveal." A recon mode: for an unfamiliar or long-unseen
  project it reveals the whole map — architecture, entry points, key folders and
  files, data flow, tech stack, where things live. It runs Glob + Grep + Explore
  subagents and caches a compact "MAP REVEALED" overview. Use when the user types
  /iddt, or asks to "map this out", "show the project structure", "what's in this
  repo", "where do I start", "give me an overview of the codebase", "recon", or in
  Hungarian "térképezd fel", "mutasd a projekt szerkezetét", "mi van ebben a
  repóban", "hol kezdjek hozzá", "adj áttekintést a kódbázisról" — and proactively
  when starting work in an unknown codebase where you need to get oriented first.
---

# IDDT — Automap Reveal 🗺️

> *Doom: IDDT (typed twice on the map) = the whole level appears, every monster and
> item included.*
> Here: you reveal the project's full map so you don't grope blindly in an unknown
> codebase.

The goal is a navigable mental map: where the code starts, where the main modules
are, how data flows, what the stack is — just enough to reach in confidently, no
more.

## The recon
Work targeted; on a large repo don't read everything, sample.

1. **Terrain:** the root and main-folder structure (Glob), the manifest/config
   files (package.json, pyproject, Cargo.toml, etc.) → that gives the **stack**.
2. **Entry points:** main / index / app / server / entry — where execution starts.
   Grep for the typical entries.
3. **Main modules:** the largest / most-imported libs, the domain folders. On a
   large codebase launch an **Explore subagent** ("medium" or "very thorough") to
   map in parallel and return just the conclusion.
4. **Data flow:** how they connect — API → service → data layer, or the
   UI → state → backend chain. Only the main arteries, not every capillary.

## Readout — MAP REVEALED

```
═══ MAP REVEALED ═══
🧱 Stack:    <languages/frameworks>
🚪 Entry:    <main entry point(s) with filename>
🗂️ Modules:  <3-6 key areas + a word each on what they do>
🔀 Dataflow: <the main chain in one sentence>
📍 Start at: <if there was a mission: the relevant entry point>
════════════════════
```

After the readout, if there was a concrete task behind `/iddt`, move on to that
point. If it was just recon, stop here — the map is the goal.

## Teeth: real recon + cache
Two things make this more than a plain prompt:

1. **Actually launch an `Explore` subagent** on a large/unknown codebase (don't
   "map" from memory). The subagent sweeps in parallel and returns only the
   conclusion — that's token-efficient, real recon.
2. **Cache the map to a file** so the next `/iddt` doesn't re-run: write the readout
   to `.claude/iddt-map.md` at the project root. If the file exists and is fresh,
   read it FIRST — if the code hasn't materially changed (check git log / mtimes),
   the cache plus a quick "changed since?" delta pass is enough.

## Restraint
The "whole map" here is the main structure, not every file. Good recon is like the
Doom automap: walls and doors show, not every texture pixel.
