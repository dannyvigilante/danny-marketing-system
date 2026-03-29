# Claude Code Integration

> Instructions for using this marketing department system with Claude Code CLI

---

## Installation

### Prerequisites

```bash
# Install Claude Code CLI (requires Node.js 18+)
npm install -g @anthropic-ai/claude-code

# Verify installation
claude --version
```

### Skill Installation

**Method 1: Individual Skills (Recommended)**

```bash
# Install the foundational GSD protocol first
claude skill install ./skills/get-shit-done/get-shit-done.skill

# Then install agent skills as you build them
claude skill install ./skills/qa-reviewer/qa-reviewer.skill
claude skill install ./skills/chief-strategist/chief-strategist.skill
# ... etc
```

**Method 2: Batch Installation**

```bash
# Install all skills at once (after they're built)
find ./skills -name "*.skill" -exec claude skill install {} \;
```

### Project Setup

```bash
# Clone the repository
git clone https://github.com/dannyvigilante/danny-marketing-system.git
cd danny-marketing-system

# Make validation script executable
chmod +x validate-skills.sh

# Validate skill structure
./validate-skills.sh
```

---

## Usage

### Agent Coordination

Each agent skill is designed to work with the **Ops Manager** as coordinator:

```bash
# Start a campaign (Ops Manager delegates to appropriate agents)
claude "Launch a campaign for our new wellness product line. Target audience: health-conscious millennials. Budget: $10K."

# Direct agent usage
claude "QA review this blog post for brand compliance" --skill qa-reviewer
claude "Research competitor pricing for meditation apps" --skill researcher
claude "Write three social media posts about mindful morning routines" --skill copywriter
```

### Brand Configuration

Switch between brands by specifying the config:

```bash
# [Your Brand 1]
claude "Create a content calendar for November" --brand ritual-wellness-club

# [Your Brand 2]
claude "Write a LinkedIn post about transracial adoption" --brand passing-notes
```

---

## Development Workflow

### Building New Agents

```bash
# Create new agent structure
mkdir -p skills/new-agent/references
cp skills/_template/SKILL.md skills/new-agent/

# Edit the skill
$EDITOR skills/new-agent/SKILL.md

# Validate structure
./validate-skills.sh

# Test locally
claude "Test prompt for new agent" --skill new-agent

# Package for distribution
claude skill package ./skills/new-agent/
```

### Debugging

```bash
# List installed skills
claude skill list

# Check skill details
claude skill info get-shit-done

# Remove problematic skill
claude skill remove agent-name

# Reinstall with fixes
claude skill install ./skills/agent-name/agent-name.skill
```

---

## Architecture Integration

This system integrates with:

- **Notion** for operational databases
- **Zapier** for automation chains
- **MCP servers** for external tool access
- **Google Drive** for brand asset management

See [docs/architecture/](docs/architecture/) for detailed integration guides.

---

*For issues or questions, see the main repository documentation.*
