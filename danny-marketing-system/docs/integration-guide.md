# System Integration Guide

> End-to-end walkthrough of how the marketing department operates

---

## How Everything Connects

The marketing department has four layers that work together:

```
┌─────────────────────────────────────────────┐
│              STRATEGY LAYER                  │
│  Chief Strategist → Content Strategist       │
│  (direction)        (editorial planning)     │
├─────────────────────────────────────────────┤
│            INTELLIGENCE LAYER                │
│  Researcher → Analyst                        │
│  (market data)  (performance data)           │
├─────────────────────────────────────────────┤
│             EXECUTION LAYER                  │
│  Copywriter → SEO Specialist → QA Reviewer   │
│  (creation)    (optimization)   (quality)     │
├─────────────────────────────────────────────┤
│            DISTRIBUTION LAYER                │
│  Channel Manager                             │
│  (publishing + cross-platform adaptation)    │
└─────────────────────────────────────────────┘

        ↕ Coordinated by: Ops Manager
        ↕ Powered by: GSD Protocol
        ↕ Backed by: Notion + Zapier + MCP
```

---

## Campaign Lifecycle: Step by Step

### Phase 1: Intake

**Danny** (or a Zapier trigger) creates a campaign request. The **Ops Manager** receives it and:

1. Parses the brief into discrete tasks
2. Creates entries in the Task Pipeline (Notion)
3. Assigns agents based on the default activation order:
   - Researcher first (competitive context)
   - Chief Strategist second (campaign direction)
   - Content Strategist third (editorial plan)
   - Execution agents fourth (creation, optimization, QA)
   - Channel Manager last (distribution)

### Phase 2: Intelligence Gathering

**Researcher** executes assigned research tasks:
- Competitive analysis (5-tier source hierarchy)
- Audience research (behavioral patterns, segment validation)
- SEO research (keyword opportunities, content gaps)
- Writes findings to Brand Knowledge Base with confidence tags

**Analyst** provides data context:
- Historical performance metrics
- Audience behavior patterns
- Anomaly detection on recent trends
- Feeds insights to Chief Strategist via handoff notes

### Phase 3: Strategy

**Chief Strategist** synthesizes intelligence into direction:
- Campaign brief with goals, positioning, objectives
- Content pillar definitions (70/20/10 balance)
- Strategic recommendations with "So What?" test applied
- Writes strategic decisions to Brand Knowledge Base

**Content Strategist** translates strategy into an executable plan:
- Content calendar with publish dates and channel assignments
- Individual content briefs for the Copywriter
- Content gap analysis to identify missing coverage
- Ensures pillar balance across the editorial calendar

### Phase 4: Execution

**Copywriter** creates content from briefs:
- Loads brand config (voice profile, audience segments)
- Reads own Learning Log for brand-specific patterns
- Writes in 8 format specs (blog, Instagram feed/story/reel, email, LinkedIn, landing page, email sequence)
- Provides 3 headline/subject line options per piece

**SEO Specialist** optimizes without compromising voice:
- On-page optimization (title tags, meta descriptions, headers, internal links)
- Keyword integration that reads naturally
- Voice check confirmation on every optimization
- Follows the principle: "Voice over keywords — always"

### Phase 5: Quality Gate

**QA Reviewer** scores against the 5-dimension rubric:

| Dimension | Weight | What It Measures |
|-----------|--------|------------------|
| Voice & Tone | 30% | Brand voice compliance |
| Message Accuracy | 25% | Claims, facts, promises |
| Audience Fit | 20% | Right message for right segment |
| Structure | 15% | Readability, formatting, flow |
| Strategic Alignment | 10% | Supports campaign objectives |

**Scoring thresholds:**
- **APPROVED** (≥ 4.0, no dimension below 3): Moves to Channel Manager
- **REVISE** (3.0-3.9 or any dimension at 2): Returns to Copywriter with specific notes
- **REJECT** (< 3.0 or any dimension at 1): Returns to Content Strategist for re-briefing

Maximum 3 revision cycles before escalation to Danny.

### Phase 6: Distribution

**Channel Manager** handles the last mile:
- Formats content for each target channel (platform-specific requirements)
- Adapts content across platforms (not copy-paste — native adaptation)
- Schedules per optimal posting windows
- Publishes and updates Content Calendar with live URLs
- Sends distribution notes to Analyst for tracking

### Phase 7: Learning

**Every agent** writes to the Agent Learning Log after every task:
- What worked, what didn't, what they'd do differently
- Brand-specific insights that accumulate over time
- QA Reviewer writes revision patterns when issues recur
- Pattern Alerts trigger after 3+ similar issues

**Analyst** closes the loop:
- Campaign performance report (7-14 days post-publish)
- Content performance analysis (ongoing)
- Insights feed back to Chief Strategist for next cycle

---

## Notion Database Workflow

### Task Pipeline States

```
New → Assigned → In Progress → In Review → Approved → Published → Complete
                                  ↓
                           Revision Needed → In Progress (loop, max 3x)
```

### Cross-Database Relationships

```
Campaign Tracker (campaign-level)
    ↓ spawns tasks in
Task Pipeline (task-level)
    ↓ scheduled in
Content Calendar (publish-level)
    ↓ learnings written to
Agent Learning Log (learning-level)
    ↓ insights stored in
Brand Knowledge Base (knowledge-level)
```

---

## Zapier Automation Triggers

Six automated chains run without human intervention:

1. **Publish Reminder** — Content Calendar item hits publish date → notify Channel Manager
2. **Status Notifications** — Task moves to "In Review" or "Blocked" → notify relevant agent/Danny
3. **Weekly Digest** — Every Monday → summary of completed tasks, published content, blockers
4. **Pattern Alert** — Learning Log receives quality pattern → notify Danny for system review
5. **Campaign Kickoff** — New campaign created → auto-scaffold 8 standard tasks in Pipeline
6. **Monthly Health Check** — First of month → create analysis tasks for each active brand

---

## MCP Coordination Flow

Every agent session follows the same 3-step MCP pattern:

```
START SESSION
  → load_brand_config(brand)         // Get voice, positioning, audience, channels
  → read_task_pipeline(my_tasks)     // See what's assigned to me
  → read_learning_log(me, brand)     // Learn from my past work on this brand

DO WORK
  → Execute per SKILL.md
  → Apply brand config throughout
  → Use past learnings to avoid repeat mistakes

END SESSION
  → update_task_status(complete)     // Move task forward in pipeline
  → write_learning_entry(...)        // Record what worked and what didn't
  → write_brand_knowledge(...)       // Store any new brand insights
```

---

## Adding a New Brand

To add a third brand to the system:

1. Create a new directory under `brand-configs/your-brand/`
2. Write four config files following the existing structure:
   - `brand-config.md` — Identity, positioning, pillars, guardrails
   - `voice-profile.md` — Voice attributes, tone modifiers, word palette
   - `audience-segments.md` — Primary/secondary/tertiary segments, anti-audience
   - `channel-strategy.md` — Channel priorities, format specs, cross-channel rules
3. Create corresponding entries in the Brand Knowledge Base (Notion)
4. Test with a single content piece through the full pipeline
5. Agents automatically adapt — the brand config is the only thing that changes

---

## Troubleshooting

**Agent produces off-brand content:**
Check the brand config files first — 90% of voice issues trace back to unclear or outdated configs. Then check the QA Reviewer's revision patterns for this brand.

**Tasks getting stuck in "In Review":**
Check if the QA Reviewer has clear scoring criteria for this content type. Review the QA rubric dimensions and ensure the content brief was specific enough.

**Campaign pipeline not moving:**
Check for blocked tasks in the Task Pipeline. The Ops Manager should surface blockers, but if a dependency is unresolved, the whole chain stalls. Look at the handoff notes between agents.

**Memory conflicts between agents:**
Most recent entry wins by default. Higher-confidence data wins over lower. Primary data wins over estimates. Strategic conflicts escalate to Chief Strategist.

---

*System Integration Guide — v1.0 — Sprint 9*
*Part of Danny Burke's Autonomous Marketing Department*
