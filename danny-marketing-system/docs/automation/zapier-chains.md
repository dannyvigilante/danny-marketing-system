# Zapier Automation Chains

> Automated workflows that connect the marketing department to external tools

---

## Overview

Zapier chains handle the automations that agents can't do in-session:
scheduled triggers, cross-platform notifications, external tool connections,
and recurring workflows. They're the department's nervous system for
time-based and event-based automation.

---

## Chain 1: Content Calendar → Publish Reminder

**Trigger:** Content Calendar item reaches publish date
**Action:** Send notification to Channel Manager (via Notion comment or Slack/email)
**Purpose:** Ensures nothing on the calendar gets missed

```
Trigger: Notion — Content Calendar entry where Publish Date = today AND Status = "Approved"
Action 1: Create Notion comment on the entry: "Ready for publication — Channel Manager"
Action 2: (Optional) Send email/Slack notification to Danny
```

## Chain 2: Task Pipeline → Status Notifications

**Trigger:** Task Pipeline status changes to "In Review" or "Blocked"
**Action:** Notify relevant agent/Danny
**Purpose:** Keeps workflow moving without manual status checking

```
Trigger: Notion — Task Pipeline entry status changes
Filter: Status = "In Review" OR Status = "Blocked"
Action: Send notification with task name, assigned agent, and status
```

## Chain 3: Weekly Department Digest

**Trigger:** Every Monday at 9am PT
**Action:** Generate summary of last week's activity
**Purpose:** Danny gets a weekly pulse without asking

```
Trigger: Schedule — Every Monday 9:00am PT
Action 1: Query Notion — Tasks completed last 7 days
Action 2: Query Notion — Content published last 7 days
Action 3: Query Notion — Tasks currently blocked
Action 4: Format digest email/Notion page
Action 5: Send to Danny
```

## Chain 4: QA Pattern Alert → Skill Update Trigger

**Trigger:** Agent Learning Log receives a "Pattern Alert" entry
**Action:** Notify Danny and flag for system review
**Purpose:** Ensures systemic quality issues get addressed

```
Trigger: Notion — New entry in Agent Learning Log with Learning Type = "Quality Pattern"
Action: Send notification to Danny with pattern details and recommended fix
```

## Chain 5: New Campaign → Full Pipeline Kickoff

**Trigger:** New Campaign Tracker entry created with Status = "Planning"
**Action:** Create initial task set in Task Pipeline
**Purpose:** Auto-scaffolds the standard campaign workflow

```
Trigger: Notion — New Campaign Tracker entry
Action 1: Create Task — "Competitive research" (Assigned: Researcher)
Action 2: Create Task — "Campaign brief" (Assigned: Chief Strategist, Depends: Research)
Action 3: Create Task — "Content plan" (Assigned: Content Strategist, Depends: Brief)
Action 4: Create Task — "Content creation" (Assigned: Copywriter, Depends: Plan)
Action 5: Create Task — "SEO optimization" (Assigned: SEO Specialist, Depends: Content)
Action 6: Create Task — "QA review" (Assigned: QA Reviewer, Depends: Optimization)
Action 7: Create Task — "Publish" (Assigned: Channel Manager, Depends: QA)
Action 8: Create Task — "Performance report" (Assigned: Analyst, Depends: Publish + 7 days)
```

## Chain 6: Monthly Brand Health Check

**Trigger:** First of every month
**Action:** Create analysis tasks for each active brand
**Purpose:** Ensures regular performance review cadence

```
Trigger: Schedule — 1st of month, 9:00am PT
Action: For each active brand in Campaign Tracker:
  Create Task — "Monthly performance analysis — [Brand]" (Assigned: Analyst)
  Create Task — "Monthly competitive refresh — [Brand]" (Assigned: Researcher)
```

---

## Implementation Notes

### Zapier Account Requirements
- Notion integration (read/write access to all 5 databases)
- Email or Slack integration (for notifications)
- Schedule triggers (for time-based chains)
- Multi-step Zaps (Chains 3, 5, and 6 require multi-step)

### Priority Order for Setup
1. Chain 2 (Task status notifications) — Highest immediate value
2. Chain 1 (Publish reminders) — Prevents missed publications
3. Chain 5 (Campaign kickoff) — Biggest time savings
4. Chain 3 (Weekly digest) — Danny visibility
5. Chain 4 (Pattern alerts) — Quality system
6. Chain 6 (Monthly health) — Operational cadence

### Testing
Test each chain with a dummy entry before going live. Verify:
- Trigger fires correctly
- Filters work as expected
- Notification content is useful (not noisy)
- No duplicate triggers

---

*Zapier Chains — v1.0 — Sprint 8*
