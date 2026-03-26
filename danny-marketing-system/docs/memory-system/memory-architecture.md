# Memory System Architecture

> How the marketing department remembers, learns, and improves across sessions

---

## Overview

The memory system is how the marketing department gets smarter over time.
Without it, every session starts from zero. With it, agents build on past
decisions, avoid repeated mistakes, and develop brand-specific intuition.

Memory operates at three tiers:

1. **Brand Knowledge Base** (Notion) — Persistent, curated facts and decisions
2. **Agent Learning Log** (Notion) — Cross-agent learning from every task
3. **Session Context** (In-conversation) — Ephemeral context within a single session

---

## Tier 1: Brand Knowledge Base

**Location:** Notion database (Brand Knowledge Base)
**Persistence:** Permanent until manually updated
**Who writes:** All agents (via handoff protocol)
**Who reads:** All agents (before starting any task)

### What Gets Stored

| Category | Examples | Written By |
|----------|----------|-----------|
| Brand Guidelines | Voice decisions, positioning changes, visual updates | Chief Strategist, Danny |
| Competitive Intel | Competitor moves, market shifts, positioning gaps | Researcher |
| Audience Research | Audience insights, behavior patterns, segment updates | Researcher, Analyst |
| Performance Data | Benchmark metrics, historical performance, trend data | Analyst |
| Strategic Decisions | Campaign direction, content pillar changes, channel priorities | Chief Strategist |
| Asset References | Logo files, template locations, approved imagery | Channel Manager |

### Read Protocol

Before starting ANY task, agents should:
1. Check Brand Knowledge Base for entries relevant to their current brand
2. Check for recent entries (last 30 days) that might affect their work
3. Check for entries tagged with their agent role

### Write Protocol

After completing ANY task, agents should:
1. Write any new brand-specific learning to the Knowledge Base
2. Update any outdated entries they discover
3. Tag entries with: Brand, Category, Source Agent, Confidence level

---

## Tier 2: Agent Learning Log

**Location:** Notion database (Agent Learning Log)
**Persistence:** Permanent (entries accumulate over time)
**Who writes:** Every agent after every task
**Who reads:** Each agent reads their own history + QA Reviewer patterns

### What Gets Stored

Every agent writes a learning entry after every task:

```
LEARNING ENTRY
Agent: [Name]
Task: [Description]
Date: [Date]
Brand: [Brand]
What worked: [Effective approaches]
What didn't: [Failed approaches]
What you'd do differently: [Improvements]
Brand-specific insight: [Learnings about this brand]
```

### Special Entries

**QA Revision Patterns** — Written by QA Reviewer when rejecting/revising:
```
REVISION PATTERN
From: QA Reviewer
About: [Agent name]
Brand: [Brand]
Pattern: [Recurring issue description]
Occurrences: [Number of times seen]
Root Cause: [Why this keeps happening]
Recommended Fix: [Specific change to the agent's approach or the brand config]
```

**Pattern Alerts** — Written when 3+ similar issues are detected:
```
PATTERN ALERT ⚠️
Agent: [Which agent keeps hitting this]
Pattern: [Description]
Impact: [How this affects output quality]
Recommended System Change: [What should be updated — skill, brand config, or workflow]
```

### Read Protocol

Before starting a task, agents should:
1. Check their own recent entries for this brand
2. Check QA Reviewer's revision patterns about them
3. Check Pattern Alerts relevant to their role

---

## Tier 3: Session Context

**Location:** In-conversation context (not persisted)
**Persistence:** Single session only
**Who manages:** Each agent during their active session

### What Gets Tracked In-Session

- Current task brief and objectives
- Decisions made during the task (with reasoning)
- Assumptions flagged per GSD protocol
- Partial outputs and revision notes
- Cross-agent handoff context

### Session-to-Persistent Protocol

At the end of every session, agents must:
1. Write their Learning Entry to the Agent Learning Log (Tier 2)
2. Write any new brand insights to the Brand Knowledge Base (Tier 1)
3. Update any Notion task statuses in the Task Pipeline
4. Ensure nothing important lives only in session context

---

## Memory Governance

### Freshness

- Brand Knowledge Base entries should have a "Last Updated" date
- Entries older than 90 days should be reviewed for accuracy
- The Analyst is responsible for refreshing performance data monthly
- The Researcher is responsible for refreshing competitive intel quarterly

### Conflicts

When memory entries conflict:
1. Most recent entry wins by default
2. Higher-confidence entry wins over lower-confidence
3. Primary data wins over estimated data
4. If conflict is strategic (not factual), escalate to Chief Strategist

### Cleanup

Quarterly, the Ops Manager should:
1. Archive outdated entries (don't delete — archive)
2. Review Pattern Alerts for systemic fixes that were implemented
3. Verify that brand configs reflect accumulated brand-specific learnings
4. Ensure the Learning Log isn't growing unmanageably

---

## Integration Points

### How Memory Connects to Each Agent

| Agent | Reads | Writes |
|-------|-------|--------|
| Ops Manager | Task Pipeline, all databases | Task status updates, department health |
| Chief Strategist | Brand Knowledge Base, Analyst reports | Strategic decisions, content pillars |
| Content Strategist | Brand Knowledge Base, Content Calendar | Content plans, editorial decisions |
| Researcher | Brand Knowledge Base (competitive) | Research findings, competitive intel |
| Analyst | Brand Knowledge Base (performance) | Performance data, audience insights |
| Copywriter | Brand configs, Learning Log (own) | Learning entries |
| SEO Specialist | Brand Knowledge Base (SEO data) | Keyword data, optimization learnings |
| QA Reviewer | Brand configs, Learning Log (all) | Revision patterns, Pattern Alerts |
| Channel Manager | Content Calendar, Brand Knowledge Base | Publishing records, channel insights |

---

## Implementation Notes

### Notion Is the Memory Layer

All persistent memory lives in Notion databases. This means:
- Memory is queryable and filterable
- Multiple agents can read/write the same databases
- Danny can review and curate memory directly
- Memory survives across Claude sessions and tools

### Brand Configs Are Static Memory

The `brand-configs/` directory is a special form of memory:
- Curated and intentional (not auto-generated)
- Updated deliberately when brand positioning changes
- Read by every agent before every task
- The "constitution" that all dynamic memory operates within

---

*Memory System Architecture — v1.0 — Sprint 7*
*Part of Danny Burke's Autonomous Marketing Department*
