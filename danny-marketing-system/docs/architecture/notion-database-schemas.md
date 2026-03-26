# Notion Database Schemas

> Complete schema definitions for all 5 operational databases

---

## 1. Task Pipeline

**Purpose:** Central work queue for all agent tasks

| Property | Type | Options |
|----------|------|---------|
| Task Name | Title | — |
| Status | Select | New, Assigned, In Progress, In Review, Revision Needed, Approved, Published, Complete |
| Assigned Agent | Select | Ops Manager, Chief Strategist, Content Strategist, Researcher, Analyst, Copywriter, SEO Specialist, QA Reviewer, Channel Manager |
| Priority | Select | Critical, High, Medium, Low |
| Brand | Select | Ritual Wellness Club, Passing Notes |
| Campaign | Relation | → Campaign Tracker |
| Due Date | Date | — |
| Output Link | URL | — |
| Handoff Notes | Rich Text | — |
| Created | Created Time | — |

**Key Views:**
- Pipeline Board (grouped by Status)
- My Approvals (filtered: Status = "In Review")
- Agent Queue (grouped by Assigned Agent)

---

## 2. Campaign Tracker

**Purpose:** Campaign-level planning and tracking

| Property | Type | Options |
|----------|------|---------|
| Campaign Name | Title | — |
| Status | Select | Planning, Active, Paused, Complete, Archived |
| Brand | Select | Ritual Wellness Club, Passing Notes |
| Start Date | Date | — |
| End Date | Date | — |
| Objective | Rich Text | — |
| Target Audience | Rich Text | — |
| Channels | Multi-Select | Blog, Instagram, LinkedIn, Email, Twitter/X, TikTok, Pinterest |
| Budget | Number (Dollar) | — |
| KPIs | Rich Text | — |
| Tasks | Relation | → Task Pipeline |
| Created | Created Time | — |

---

## 3. Content Calendar

**Purpose:** Publishing schedule across all channels

| Property | Type | Options |
|----------|------|---------|
| Content Title | Title | — |
| Status | Select | Planned, Drafting, In Review, Approved, Scheduled, Published |
| Brand | Select | Ritual Wellness Club, Passing Notes |
| Channel | Select | Blog, Instagram, LinkedIn, Email, Twitter/X, TikTok, Pinterest |
| Publish Date | Date | — |
| Content Type | Select | Blog Post, Social Post, Email, Landing Page, Video Script, Infographic |
| Campaign | Relation | → Campaign Tracker |
| Asset Link | URL | — |
| Notes | Rich Text | — |
| Created | Created Time | — |

**Key Views:**
- Calendar View (by Publish Date)
- By Channel (grouped by Channel)
- This Week (filtered by date range)

---

## 4. Agent Learning Log

**Purpose:** Cross-agent memory system for continuous improvement

| Property | Type | Options |
|----------|------|---------|
| Entry Title | Title | — |
| Agent | Select | Ops Manager, Chief Strategist, Content Strategist, Researcher, Analyst, Copywriter, SEO Specialist, QA Reviewer, Channel Manager |
| Learning Type | Select | What Worked, What Didn't, Brand Insight, Process Improvement, Quality Pattern |
| Brand | Select | Ritual Wellness Club, Passing Notes, System-Wide |
| Details | Rich Text | — |
| Related Task | Relation | → Task Pipeline |
| Created | Created Time | — |

**Key Views:**
- Recent Learnings (sorted by Created, descending)
- By Agent (grouped by Agent)
- Brand Insights (filtered by Learning Type = "Brand Insight")

---

## 5. Brand Knowledge Base

**Purpose:** Centralized brand facts, decisions, and reference material

| Property | Type | Options |
|----------|------|---------|
| Entry Title | Title | — |
| Brand | Select | Ritual Wellness Club, Passing Notes |
| Category | Select | Brand Guidelines, Competitive Intel, Audience Research, Performance Data, Strategic Decision, Asset Reference |
| Source Agent | Select | Chief Strategist, Researcher, Analyst, QA Reviewer, Manual Entry |
| Content | Rich Text | — |
| Confidence | Select | Verified, High Confidence, Estimated, Needs Validation |
| Last Updated | Date | — |
| Created | Created Time | — |

**Key Views:**
- By Brand (grouped by Brand)
- By Category (grouped by Category)
- Recent Updates (sorted by Last Updated)

---

## Setup Instructions

These schemas are designed to be created in Notion via the Notion MCP connector. The databases should live under:

```
🏠 Danny's Home Base → 🚀 Entrepreneurial → 🏢 Marketing Department
```

All databases are already live in Danny's Notion workspace.

---

*Schema version: 1.0 — Sprint 1*
