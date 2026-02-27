---
name: fetch-task
description: Guide for fetching and solving tasks from ClickUp. Use this when asked to fetch tasks from ClickUp.
argument-hint: "TICKET-ID"
---

## Step 1: Fetch the task

- Use ClickUp MCP `clickup_get_task` with task_id `$ARGUMENTS` and `subtasks: true`
- Use `clickup_get_task_comments` to fetch all comments on the task
- Summarize the task requirements before proceeding

## Step 2: Check for Figma links

- Scan the task description and comments for Figma URLs (`figma.com`)
- If found, use the Figma MCP to retrieve design context
- Note any UI text/copy from the Figma designs for translation reference

## Step 3: Solve the task

Follow these rules while implementing:

- **Pint linting** — Only run if PHP files were changed
- **Docker exec** — Never run PHP/database commands directly. Always: `docker exec blueventure_php <command>`
- **Translations** — No hardcoded user-facing strings. Use `lang/en` files. Never edit `resources/js/i18n/en.json` (auto-generated). Never add translation fallbacks (they are deterministic).
- **Figma vs codebase** — If a translation differs from Figma, edit it to match Figma
- **Backend tests** — Run `make prepare-tests` before running tests via `docker exec blueventure_php`
- **Frontend testing** — Never run `yarn build` as a test step
- **Framework conventions** — Use latest Vue + Laravel best practices and project skills, but this skill's rules always win

## Rules

- **CRITICAL: Do NOT proceed until you have a clear understanding of the task requirements.** If anything is unclear, ask for clarification.
- **CRITICAL: Do NOT start coding until you have a clear plan for how to solve the task.** This includes understanding the requirements, identifying necessary changes, and how to implement them.
- **CRITICAL: Do NOT commit any changes in this skill AT ALL.** This skill is only for fetching and solving the task. Committing changes is handled in the `review-and-commit` skill.
