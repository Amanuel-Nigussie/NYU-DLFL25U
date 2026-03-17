# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Task

Add lesson entries to `index.md`. For each lesson, ask the user for:

- **Title & punch line**
- **YouTube link**
- **Suggested readings** (with author/year if not obvious)
- **Suggested videos** (with author/year)
- **Blackboard image link(s)** from Google Drive

## Lesson entry format

```markdown
## Lesson NN: Title [🎥](https://youtu.be/...)

*Punch line*

**Suggested readings**
- Author (year) [*Title in sentence case*](url)

**Suggested videos**
- Author (year) [*Title in sentence case*](url)

[![Lesson NN blackboard](https://lh3.googleusercontent.com/d/<fileId>)](https://drive.google.com/file/d/<fileId>/)
```

- Blackboard image goes **after** suggested material
- Multiple blackboards: label them `blackboard 1`, `blackboard 2`, etc.
- No suggested readings/videos section if none provided

## Images

Blackboard share links look like:
`https://drive.google.com/file/d/<fileId>/view?usp=drive_link`

Strip everything after the file ID. Display URL: `https://lh3.googleusercontent.com/d/<fileId>`

## Citations

Format: `Author (year) [*Title in sentence case*](url)`
- Use last name(s) only: `McCulloch & Pitts (1943)`
- For organisations or collectives: `Intel (1974)`, `Monty Python (1969)`
- Wikipedia articles with no clear author: omit author, keep year if meaningful
- Sanitise URLs: remove tracking params like `?usp=drive_link`, `?si=...`
