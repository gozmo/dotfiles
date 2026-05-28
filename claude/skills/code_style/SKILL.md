---
allowed-tools: Bash(gh issue view:*), Bash(gh search:*), Bash(gh issue list:*), Bash(gh pr comment:*), Bash(gh pr diff:*), Bash(gh pr view:*), Bash(gh pr list:*)
description: Code review a pull request
disable-model-invocation: false
---

Check the code quality and architecture

Do these steps

1. Check for DRY, do not repeat yourself
2. Does variable names fullfill the clean code naming convention
3. Does function names fullfill the clean code naming convention
4. Is a state passed around
   a. Should the state be a dataclass
   b. Should the functions be moved into a class and the class holds the state
5. Are the functions big, can they be split into multiple functions
6. Do functions have too many parameters (>3 is a smell, consider a dataclass or splitting)
7. Is nesting too deep, can guard clauses / early returns flatten it
8. Single Responsibility — does each function/class do one thing at one abstraction level
9. Are there magic numbers or strings that should be named constants
10. Boolean flag parameters — usually a smell that the function should be split
11. Are type hints present and accurate (especially in Python)
12. Comments explain *why*, not *what*; flag stale or redundant ones
13. Error handling — not swallowed, not over-broad `except`
14. Testability — pure functions where possible, side effects isolated, dependencies injectable
