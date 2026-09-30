---
schema_version: 1
card_id: "01a0f29b-f7c2-7a67-922a-bd2b275ccee2"
revision: 1
status: proposed
primary_repository_id: "01a0f269-9dd8-7aa5-ad00-2237c230ecf7"
repositories:
  - id: "01a0f269-9dd8-7aa5-ad00-2237c230ecf7"
    base_commit: "5a10436e354bba2b5dbbbd9086fb785b13b75709"
acceptance_ids: [AC-001, AC-002]
plan_path: plan.json
supersedes_revision: null
ui_impact: false
test_plan:
  commands:
    - repository_id: "01a0f269-9dd8-7aa5-ad00-2237c230ecf7"
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

