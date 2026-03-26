# MCP Coordination Server

> How the marketing department agents share context through Model Context Protocol

---

## Overview

MCP (Model Context Protocol) provides the real-time coordination layer that
Notion databases can't. While Notion stores persistent state, MCP handles
in-session context sharing, tool access, and cross-agent communication.

---

## MCP Server Architecture

### Marketing Department MCP Server

A single MCP server that exposes tools for all agents to use:

```
danny-marketing-mcp/
├── server.ts (or server.py)
├── tools/
│   ├── notion-ops.ts      — Read/write to all 5 Notion databases
│   ├── brand-config.ts    — Load brand configs by name
│   ├── agent-memory.ts    — Read/write to Agent Learning Log
│   ├── pipeline.ts        — Task Pipeline management
│   └── publishing.ts      — Channel publishing helpers
├── resources/
│   ├── brand-configs/     — Serve brand configs as MCP resources
│   └── templates/         — Serve output templates as MCP resources
└── config.json
```

### Core MCP Tools

#### `load_brand_config`
```
Input: { brand: "ritual-wellness-club" }
Output: { brand_config, voice_profile, audience_segments, channel_strategy }
```
Every agent calls this before starting work. Returns all 4 config files for the specified brand.

#### `read_task_pipeline`
```
Input: { filter: { status: "In Review", assigned_agent: "qa-reviewer" } }
Output: [{ task_id, title, status, assigned_agent, handoff_notes, ... }]
```
Agents read the pipeline to see their assigned tasks.

#### `update_task_status`
```
Input: { task_id: "xxx", status: "Complete", handoff_notes: "..." }
Output: { success: true }
```
Agents update task status after completing work.

#### `write_learning_entry`
```
Input: { agent: "copywriter", brand: "ritual-wellness-club", entry: { ... } }
Output: { entry_id: "xxx" }
```
Agents write their learning entries after every task.

#### `read_learning_log`
```
Input: { agent: "copywriter", brand: "ritual-wellness-club", limit: 5 }
Output: [{ entry_id, task, what_worked, what_didnt, ... }]
```
Agents read their own history before starting a new task.

#### `write_brand_knowledge`
```
Input: { brand: "ritual-wellness-club", category: "Competitive Intel", content: "...", confidence: "High" }
Output: { entry_id: "xxx" }
```
Agents write new knowledge to the Brand Knowledge Base.

#### `read_brand_knowledge`
```
Input: { brand: "ritual-wellness-club", category: "Performance Data", limit: 10 }
Output: [{ entry_id, title, content, confidence, last_updated, ... }]
```
Agents read relevant brand knowledge before making decisions.

---

## MCP Resources

MCP resources provide read-only access to reference material:

### Brand Config Resources
```
resource://brand-configs/ritual-wellness-club/brand-config
resource://brand-configs/ritual-wellness-club/voice-profile
resource://brand-configs/ritual-wellness-club/audience-segments
resource://brand-configs/ritual-wellness-club/channel-strategy
resource://brand-configs/passing-notes/brand-config
... etc
```

### Template Resources
```
resource://templates/campaign-brief
resource://templates/content-brief
resource://templates/qa-review
resource://templates/learning-entry
resource://templates/handoff-note
```

---

## Agent Integration Pattern

Every agent session follows this MCP pattern:

```
1. START SESSION
   → load_brand_config(brand)
   → read_task_pipeline(filter: my_tasks)
   → read_learning_log(agent: me, brand: this_brand)

2. DO WORK
   → Use brand config for voice/positioning
   → Apply learnings from log
   → Execute per SKILL.md

3. END SESSION
   → update_task_status(task, "Complete", handoff_notes)
   → write_learning_entry(what_worked, what_didnt, ...)
   → write_brand_knowledge(any new insights)
```

---

## Cowork Integration

For Claude Cowork scheduled tasks, MCP provides the context layer:

### Scheduled Task: Daily Content Calendar Check
```
Schedule: Daily, 8:00am PT
MCP calls:
  → read_task_pipeline(filter: { status: "Approved", publish_date: today })
  → For each: notify Channel Manager via Notion comment
```

### Scheduled Task: Weekly Performance Snapshot
```
Schedule: Monday, 9:00am PT
MCP calls:
  → read_brand_knowledge(category: "Performance Data", last_7_days: true)
  → Generate snapshot for Danny
```

### Scheduled Task: Quarterly Strategy Trigger
```
Schedule: First Monday of quarter
MCP calls:
  → read_learning_log(agent: "all", last_90_days: true)
  → read_brand_knowledge(category: "Strategic Decisions")
  → Create task for Chief Strategist: "Quarterly strategy review"
```

---

## Implementation Roadmap

### Phase 1: Notion-backed (Current)
All MCP tools are thin wrappers around Notion API calls. This works for the
current scale and requires no additional infrastructure.

### Phase 2: Enhanced (Future)
If scale demands it:
- Add caching layer for frequently-read brand configs
- Add webhook support for real-time task status notifications
- Add cross-agent message passing for in-session coordination

### Phase 3: Full Autonomy (Future)
- MCP server runs continuously, managing agent scheduling
- Agents trigger each other via MCP events
- The Ops Manager agent runs as a persistent coordinator

---

## Technical Requirements

### To Build the MCP Server
- Node.js 18+ (TypeScript) or Python 3.10+ (FastMCP)
- Notion API access (integration token with full database permissions)
- Claude Code or Cowork for agent execution

### Environment Variables
```
NOTION_API_TOKEN=secret_xxx
NOTION_TASK_PIPELINE_DB=xxx
NOTION_CAMPAIGN_TRACKER_DB=xxx
NOTION_CONTENT_CALENDAR_DB=xxx
NOTION_LEARNING_LOG_DB=xxx
NOTION_BRAND_KNOWLEDGE_DB=xxx
```

---

*MCP Coordination — v1.0 — Sprint 8*
*Part of Danny Burke's Autonomous Marketing Department*
