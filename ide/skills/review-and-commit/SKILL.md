---
name: review-and-commit
description: Run CodeRabbit CLI to review uncommitted changes, fix critical issues, and verify the fixes. Use this when a branch is done and ready for review.
---

## Step 1: Run CodeRabbit review

- Run `coderabbit --prompt-only --type uncommitted` with a **10-minute timeout**
- **CRITICAL: Do NOT run this in the background. Do NOT proceed until CodeRabbit finishes. Do NOT stop it early. Wait for complete output before moving on.**

## Step 2: Fix critical issues

- Evaluate all fixes and considerations from the CodeRabbit output
- **Fix major and critical issues only** — ignore nits and minor suggestions
- Implement the fixes

## Step 3: Run CodeRabbit review again

- Run `coderabbit --prompt-only --type uncommitted` a second time with a **10-minute timeout**
- **CRITICAL: Do NOT run this in the background. Do NOT proceed until CodeRabbit finishes. Do NOT stop it early. Wait for complete output before moving on.**

## Step 4: Finalize

- **Only run the loop twice.** If no critical issues remain after the second run, you are done — ignore any remaining nits.
- Provide a summary of:
  - What critical issues were found in the first review
  - What fixes were applied
  - Whether the second review passed clean or what was left as acceptable