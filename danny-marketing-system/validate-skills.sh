#!/bin/bash
# validate-skills.sh — Validates skill directory structure and required files
# Usage: ./validate-skills.sh [skill-directory]
# If no directory specified, validates all skills in ./skills/

SKILLS_DIR="${1:-./skills}"
ERRORS=0
WARNINGS=0
CHECKED=0

echo "============================================"
echo "  Marketing Department Skill Validator"
echo "============================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

pass() {
    echo -e "  ${GREEN}✓${NC} $1"
}

fail() {
    echo -e "  ${RED}✗${NC} $1"
    ERRORS=$((ERRORS + 1))
}

warn() {
    echo -e "  ${YELLOW}⚠${NC} $1"
    WARNINGS=$((WARNINGS + 1))
}

# Check if skills directory exists
if [ ! -d "$SKILLS_DIR" ]; then
    echo -e "${RED}ERROR: Skills directory not found: $SKILLS_DIR${NC}"
    exit 1
fi

# Iterate through skill directories
for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")

    # Skip template directory
    if [ "$skill_name" = "_template" ]; then
        continue
    fi

    CHECKED=$((CHECKED + 1))
    echo "Checking: $skill_name"
    echo "--------------------------------------------"

    # Check for SKILL.md
    if [ ! -f "$skill_dir/SKILL.md" ]; then
        fail "Missing SKILL.md"
    else
        # Check SKILL.md has frontmatter
        if head -1 "$skill_dir/SKILL.md" | grep -q "^---"; then
            pass "SKILL.md has frontmatter"

            # Check for required frontmatter fields
            if grep -q "^name:" "$skill_dir/SKILL.md"; then
                pass "Has 'name' field"
            else
                fail "Missing 'name' field in frontmatter"
            fi

            if grep -q "^description:" "$skill_dir/SKILL.md"; then
                pass "Has 'description' field"
            else
                fail "Missing 'description' field in frontmatter"
            fi
        else
            fail "SKILL.md missing frontmatter (should start with ---)"
        fi

        # Check SKILL.md line count
        lines=$(wc -l < "$skill_dir/SKILL.md")
        if [ "$lines" -lt 10 ]; then
            warn "SKILL.md is only $lines lines (placeholder?)"
        else
            pass "SKILL.md has $lines lines of content"
        fi
    fi

    # Check for references directory
    if [ ! -d "$skill_dir/references" ]; then
        warn "No references/ directory"
    else
        ref_count=$(find "$skill_dir/references" -type f ! -name '.gitkeep' | wc -l)
        if [ "$ref_count" -eq 0 ]; then
            warn "references/ directory is empty"
        else
            pass "references/ has $ref_count file(s)"
        fi
    fi

    echo ""
done

# Summary
echo "============================================"
echo "  Validation Summary"
echo "============================================"
echo "  Skills checked: $CHECKED"
echo -e "  ${GREEN}Passed${NC}: $((CHECKED * 3 - ERRORS - WARNINGS)) checks"
echo -e "  ${RED}Errors${NC}: $ERRORS"
echo -e "  ${YELLOW}Warnings${NC}: $WARNINGS"
echo "============================================"

if [ "$ERRORS" -gt 0 ]; then
    echo -e "\n${RED}Validation FAILED — fix errors before committing.${NC}"
    exit 1
else
    echo -e "\n${GREEN}Validation PASSED${NC}"
    if [ "$WARNINGS" -gt 0 ]; then
        echo -e "${YELLOW}(Review warnings above)${NC}"
    fi
    exit 0
fi
