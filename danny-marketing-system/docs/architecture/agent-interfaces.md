# Agent Interfaces

> How agents communicate, hand off work, and coordinate through the Notion operational backbone

---

## Communication Model

All agent communication flows through Notion databases. Agents don't talk to each other directly — they read from and write to shared databases, with the Ops Manager orchestrating task flow.

```
Brief/Request → Ops Manager → Task Pipeline → Agent → Output → QA Review → Channel Manager → Published
```

---

## Agent Interface Definitions

### Ops Manager (Orchestrator)
- **Reads from:** Task Pipeline (incoming briefs), Campaign Tracker (campaign status), Agent Learning Log (performance patterns)
- **Writes to:** Task Pipeline (task assignments), all agent queues
- **Triggers:** New brief submission, campaign milestone, agent completion signal
- **Escalates to:** CEO (Danny) for strategic decisions, budget approval, brand voice changes

### Chief Strategist
- **Reads from:** Brand Knowledge Base, Campaign Tracker, Analyst reports, market research
- **Writes to:** Task Pipeline (strategic briefs), Campaign Tracker (campaign plans), Brand Knowledge Base (strategic decisions)
- **Triggers:** New campaign request, quarterly planning cycle, market shift signal
- **Hands off to:** Content Strategist (editorial direction), Researcher (research briefs)

### Content Strategist
- **Reads from:** Chief Strategist briefs, Brand Knowledge Base, Content Calendar, performance data
- **Writes to:** Content Calendar (editorial plan), Task Pipeline (content briefs for Copywriter)
- **Triggers:** Strategic brief from Chief Strategist, calendar gap, performance insight
- **Hands off to:** Copywriter (content briefs), SEO Specialist (optimization briefs)

### Researcher
- **Reads from:** Task Pipeline (research briefs), Brand Knowledge Base (competitive landscape)
- **Writes to:** Brand Knowledge Base (research findings), Task Pipeline (research deliverables)
- **Triggers:** Research brief from Chief Strategist or Ops Manager, competitive alert
- **Hands off to:** Analyst (data for analysis), Chief Strategist (strategic intelligence)

### Analyst
- **Reads from:** Performance data (via integrations), Campaign Tracker, Content Calendar
- **Writes to:** Brand Knowledge Base (performance insights), Task Pipeline (analysis reports)
- **Triggers:** Campaign completion, weekly/monthly cycle, anomaly detection
- **Hands off to:** Chief Strategist (strategic insights), Content Strategist (content performance)

### Copywriter
- **Reads from:** Content briefs (from Content Strategist), Brand configs, SEO recommendations
- **Writes to:** Task Pipeline (draft content), Content Calendar (content assets)
- **Triggers:** Content brief assignment, revision request from QA Reviewer
- **Hands off to:** QA Reviewer (all content before publication)

### SEO Specialist
- **Reads from:** Content drafts, keyword research, SERP data, competitor analysis
- **Writes to:** Task Pipeline (SEO recommendations), Content Calendar (optimized content)
- **Triggers:** New content draft, monthly SEO audit cycle, ranking changes
- **Hands off to:** Copywriter (optimization recommendations), QA Reviewer (SEO-optimized content)

### QA Reviewer
- **Reads from:** All agent outputs pending review, Brand configs (compliance criteria), Agent Learning Log (revision patterns)
- **Writes to:** Task Pipeline (approval/rejection), Agent Learning Log (revision patterns and quality insights)
- **Triggers:** Any content moved to "In Review" status
- **Hands off to:** Channel Manager (approved content), originating agent (revision requests)

### Channel Manager
- **Reads from:** Approved content (from QA Reviewer), Content Calendar (schedule), channel-specific requirements
- **Writes to:** Content Calendar (published status), Task Pipeline (distribution confirmation)
- **Triggers:** Content approval from QA Reviewer, scheduled publication time
- **Hands off to:** Analyst (post-publication tracking)

---

## Task Pipeline States

```
New → Assigned → In Progress → In Review → Approved → Published → Complete
                                    ↓
                              Revision Needed → In Progress (loop)
```

---

## Handoff Note Format

Every agent-to-agent handoff includes:

```
HANDOFF NOTE
From: [Agent Name]
To: [Next Agent or "QA Review"]
Task: [Brief description]
Output: [File/page reference]
Assumptions made: [Decisions made without human input]
Known limitations: [What the next agent should know]
Suggested next step: [Recommended action]
```

---

*This document governs all inter-agent communication. Agents that bypass this interface risk breaking the coordination chain.*
