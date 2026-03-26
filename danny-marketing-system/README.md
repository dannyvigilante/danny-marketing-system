# Danny's Multi-Agent Marketing Department

> Autonomous 9-agent system for end-to-end marketing execution across multiple brands

---

## What This Is

A complete marketing department built from AI agents, designed for Danny Burke's multi-brand portfolio. Drop a campaign brief in one end, get executed marketing campaigns out the other. The system handles strategy, content creation, optimization, distribution, and performance tracking across channels.

**Primary brands:** Ritual Wellness Club (holistic health), Passing Notes Through a Glass Wall (memoir marketing)
**Architecture:** 9 specialized agents + Notion operational backbone + Zapier automation
**Key innovation:** Modular brand configurations — same system, different brands

---

## Agent Architecture

```
Ops Manager (Orchestrator)
├── Chief Strategist
├── Content Strategist
├── Researcher
├── Analyst
├── Copywriter
├── SEO Specialist
├── QA Reviewer
└── Channel Manager
```

**Ops Manager** coordinates all agents, handles task decomposition, monitors progress
**Chief Strategist** sets content pillars, campaign briefs, quarterly direction
**Content Strategist** bridges strategy and execution with editorial planning
**Researcher** provides competitive intelligence and SEO audits
**Analyst** tracks performance and feeds insights back to strategy
**Copywriter** creates all content across formats and channels
**SEO Specialist** optimizes for search across all content
**QA Reviewer** ensures brand compliance and quality before publication
**Channel Manager** handles distribution, formatting, and scheduling

---

## Brand Modularity

The system is brand-agnostic by design. Each brand gets a configuration directory:

```
brand-configs/
├── ritual-wellness-club/
│   ├── brand-config.md
│   ├── voice-profile.md
│   ├── audience-segments.md
│   └── channel-strategy.md
└── passing-notes/
    ├── brand-config.md
    ├── voice-profile.md
    ├── audience-segments.md
    └── channel-strategy.md
```

Swap configs, get completely different output. Same operational intelligence, different brand expression.

---

## Operational Backbone

**Notion Databases:**
- Task Pipeline (agent coordination)
- Campaign Tracker (campaign-level management)
- Content Calendar (publishing schedule)
- Agent Learning Log (memory system)
- Brand Knowledge Base (facts and decisions)

**Automation:**
- Zapier chains for agent handoffs
- MCP coordination server for shared context
- Cowork integration for scheduled tasks

---

## Development Status

**Sprint 1:** ✅ Foundation — GSD protocol, Notion ops, 9-agent architecture
**Sprint 2:** ✅ QA Reviewer — Brand compliance quality gate with weighted scoring rubric
**Sprint 3:** ✅ Brand Configurations — Ritual Wellness Club + Passing Notes (8 config files)
**Sprint 4:** ✅ Intelligence Layer — Researcher + Analyst agents (635 lines)
**Sprint 5:** ✅ Strategy Layer — Chief Strategist + Content Strategist + Ops Manager (786 lines)
**Sprint 6:** ✅ Execution Layer — Copywriter + SEO Specialist + Channel Manager (616 lines)
**Sprint 7:** ✅ Memory System — 3-tier learning architecture
**Sprint 8:** ✅ Automation — Zapier chains + MCP coordination server
**Sprint 9:** ✅ Polish & Ship — Validation, integration docs, final packaging

---

## System Stats

| Metric | Count |
|--------|-------|
| Agent Skills | 10 (9 agents + GSD protocol) |
| Brand Configurations | 2 brands × 4 config files = 8 files |
| Notion Databases | 5 (Task Pipeline, Campaign Tracker, Content Calendar, Learning Log, Knowledge Base) |
| Zapier Chains | 6 automated workflows |
| MCP Tools | 7 coordination tools |
| Total Lines | ~4,500+ across 37 files |

---

## Quick Start

### 1. Clone and Validate

```bash
git clone https://github.com/dannyvigilante/danny-marketing-system.git
cd danny-marketing-system
chmod +x validate-skills.sh
./validate-skills.sh
```

### 2. Set Up Notion Databases

Import the 5 database schemas from `docs/architecture/notion-database-schemas.md` into your Notion workspace. These databases form the operational backbone.

### 3. Configure Environment

```bash
# Required for MCP coordination server
export NOTION_API_TOKEN=secret_xxx
export NOTION_TASK_PIPELINE_DB=your_db_id
export NOTION_CAMPAIGN_TRACKER_DB=your_db_id
export NOTION_CONTENT_CALENDAR_DB=your_db_id
export NOTION_LEARNING_LOG_DB=your_db_id
export NOTION_BRAND_KNOWLEDGE_DB=your_db_id
```

### 4. Install Agent Skills

```bash
# Foundation first
claude skill install ./skills/get-shit-done/get-shit-done.skill

# Then all agents
find ./skills -name "*.skill" -exec claude skill install {} \;
```

### 5. Run a Campaign

```bash
# Ops Manager coordinates everything
claude "Launch a campaign for Ritual Wellness Club's spring membership drive"

# Or use individual agents
claude "QA review this blog post" --skill qa-reviewer
claude "Research Portland wellness market competitors" --skill researcher
```

---

## Documentation

### Architecture
- [Agent Interfaces](docs/architecture/agent-interfaces.md) — Read/write/trigger/handoff interfaces for all 9 agents
- [Notion Database Schemas](docs/architecture/notion-database-schemas.md) — Complete schemas for all 5 databases
- [Competitive Analysis](docs/architecture/competitive-analysis.md) — How this system compares to CrewAI, AutoGen, Jasper, etc.

### Operations
- [Memory Architecture](docs/memory-system/memory-architecture.md) — 3-tier learning system
- [MCP Coordination](docs/automation/mcp-coordination.md) — Cross-agent context sharing server
- [Zapier Chains](docs/automation/zapier-chains.md) — 6 automated workflows

### Integration
- [Claude Code Integration](CLAUDE.md) — CLI usage, skill installation, development workflow
- [System Integration Guide](docs/integration-guide.md) — End-to-end workflow walkthrough

---

## How It Works

**A campaign flows through the system like this:**

1. **Ops Manager** receives a brief, decomposes it into tasks, assigns agents
2. **Chief Strategist** sets campaign direction, content pillars, positioning
3. **Researcher** gathers competitive intelligence, audience data, market trends
4. **Content Strategist** translates strategy into an editorial plan with content briefs
5. **Copywriter** creates content across all specified formats and channels
6. **SEO Specialist** optimizes for search without compromising brand voice
7. **QA Reviewer** scores against a 5-dimension rubric (must score ≥ 4.0 to pass)
8. **Channel Manager** formats for each platform and publishes on schedule
9. **Analyst** tracks performance and feeds insights back to the Strategist

Every agent loads the **GSD protocol** for autonomous problem-solving, reads from the **Brand Knowledge Base** for context, and writes to the **Agent Learning Log** after every task. The system gets smarter with every execution cycle.

---

Built by [Danny Burke](https://github.com/dannyvigilante) — autonomous marketing execution across multiple brands.

*Completed: March 2026*
