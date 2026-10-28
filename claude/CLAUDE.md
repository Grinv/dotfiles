# Subagent Delegation Policy

Applies across all projects on this machine. Goal: save conversation tokens by pushing self-contained work to subagents, matching each subtask to the cheapest model that can do it correctly, and not trusting a subagent's report until it's checked.

## When to delegate

Delegate when the subtask is self-contained (doesn't need this conversation's running history), would otherwise dump a lot of raw tool output into context (broad search, log/file scanning, exploratory research), or is a naturally separable chunk of a larger task. Don't delegate trivial one-liners, or a step that depends heavily on judgment calls already made earlier this turn — for that, fork (subagent_type: "fork") instead of starting fresh, since a fork inherits full context.

## Choosing a model

**Always pass the Agent tool's `model` param explicitly** on every non-fork dispatch — never rely on a default. Built-in agents (`general-purpose`, `Explore`, `Plan`) otherwise inherit the main conversation's model (opus), which silently makes the middle tier as expensive as the heavy one. The per-call `model` param outranks everything else (frontmatter, `CLAUDE_CODE_SUBAGENT_MODEL`). Forks ignore it and always run on the main model.

- **haiku** → `quick-task` — mechanical, unambiguous subtasks: simple lookups, boilerplate edits, running and summarizing a command, well-specified file changes.
- **sonnet** → `general-purpose` / `Explore` / `Plan` — most delegated engineering work: well-scoped research and code search, implementation with a clear spec and checkable result (tests, diff), gathering/summarizing docs.
- **opus** → `deep-task` — architecture-level decisions, subtle or security-sensitive bugs, a second-opinion review of another subagent's risky output, and **open-ended work where the subagent itself must decide *what* to do** (vague research, judgment-heavy investigation). Also anything touching production data/systems or large multi-file changes where a quiet break is likely.
- For a one-off task that doesn't fit a dedicated definition, pick the tier's model via the same `model` param instead of inventing a new agent type.

## Minimal context

Fresh (non-fork) subagents start with zero memory of this conversation. Write self-contained prompts: what to do, the relevant file paths/line numbers/facts, and constraints already ruled out — not a dump of the conversation "for context," which defeats the token savings. Use `fork` only when the subtask genuinely needs the full conversation history.

## Validate before trusting

Treat a subagent's summary as a claim, not a fact — it describes what it intended to do, not necessarily what happened. For consequential changes (edits, deletions, anything the user will see), check the actual diff/output yourself before reporting done; don't just relay the subagent's own account of itself. A PostToolUse hook also runs an automatic haiku-model check on every subagent dispatch and flags mismatches between the claimed result and the actual tool output — if it raises a concern, investigate before proceeding, but it's a cheap sanity net, not a substitute for your own check on anything risky.
