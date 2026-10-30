# World Builder Platform

A web platform for building fictional universes, stories and characters.

## Features

- User registration and login with hashed passwords
- Role-based access (user / admin)
- Create and manage universes with public or private visibility
- Create locations, species and characters within a universe
- Define relationships between characters
- Write stories as ordered story segments
- Organize images into albums
- Tag universes
- Review and rate universes

## Tech Stack

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** C#
- **Database:** T-SQL (Microsoft SQL Server)

## Project Structure

```
WorldBuilderPlatform/
├── WorldBuilderPlatform/   # application source code
└── database/               # database schema and scripts
```

## Database Design

The relational model consists of the following main entities: `Users`, `Role`, `Universe`, `Location`, `Species`, `Characters`, `StorySegment`, `Tag`, `Review`, `Album` and `Image`.

A universe is the central entity: locations, characters, species and story segments all belong to a universe. Characters can be linked to each other through a typed relationship (`relation_type`), and story segments are ordered with `order_index`.