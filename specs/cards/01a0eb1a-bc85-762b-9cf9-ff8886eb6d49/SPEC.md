---
schema_version: 1
card_id: "01a0eb1a-bc85-762b-9cf9-ff8886eb6d49"
revision: 1
status: proposed
primary_repository_id: "01a0eaca-f1a6-7e75-ac5b-bb0a2680a060"
repositories:
  - id: "01a0eaca-f1a6-7e75-ac5b-bb0a2680a060"
    base_commit: "63be8227fb57c93f00cd82b1fc90e564dd0338d9"
acceptance_ids: [AC-001, AC-002]
plan_path: plan.json
supersedes_revision: null
ui_impact: false
test_plan:
  commands:
    - repository_id: "01a0eaca-f1a6-7e75-ac5b-bb0a2680a060"
      command: "npm test"
      expected_receipt: exit_zero
      acceptance_ids: [AC-001, AC-002]
unresolved_dependencies: []
---
# The contract

## Problem

The widget count is wrong when the list is empty.

## Context

The count is read in `src/count.js`; the test suite runs with `npm test`.

## Goals

An empty list counts zero.

## Non-goals

Changing the list's storage.

## Requirements

1. `count([])` returns 0.
2. A non-array input is refused with a TypeError.

## Acceptance criteria

- AC-001: `count([])` is 0.
- AC-002: `count(null)` throws a TypeError (failure case).

## Design

Guard the input, then return the length.

## Alternatives

A default parameter was rejected: it hides the null case.

## Repository scope

The primary repository: `src/count.js` and its test; no migration; compatible.

## Test plan

AC-001 and AC-002 by `npm test` (baseline: AC-001 fails today); no UI.

## Rollout and rollback

Ships with the next release; revert the commit to roll back.

## Security

No new input surface.

## Metrics

None beyond the test suite.

## Limitations

None known.

## Plan

One execution step, `implement`, about an hour.

## Unresolved dependencies

None.

