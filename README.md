# Terraform Learning Journey

This repository is my day-by-day learning log as I study **Terraform** and **Infrastructure as Code (IaC)**, and build hands-on projects on **AWS**. I'm documenting this journey as part of my move toward a career in cloud engineering and architecture, and to have a public record of what I've learned and built.

Each day I study, I add a new notes file summarizing what I learned that day, along with any diagrams, commands, or code I worked with. Over time this repo will also include actual Terraform projects (e.g., a 3-tier AWS application) that put the concepts into practice.

## Repository Structure

```
terraform-learning-journey/
├── README.md              # This file — overview and daily progress log
├── days/                  # Daily learning notes (Day 1, Day 2, ...)
│   └── day_01.md
├── assets/                # Diagrams and images used in the notes
│   └── images
└── projects/               # Hands-on Terraform + AWS projects (added as I build them)
```

## Progress Log

| Day | Topic | Notes |
|-----|-------|-------|
| 1 | How Terraform works, what is IaC, Terraform workflow, installing Terraform | [day_01.md](Days/day_01/day_01.md) |
| 2 | Hands-on: creating an AWS S3 bucket with Terraform (init/plan/apply/destroy, state file, AWS auth) | [day_02.md](Days/day_02/day_02.md) |
| 3 | Terraform state file deep dive, remote backends, S3 native state locking, hands-on remote backend setup | [day_03.md](Days/day_03/day_03.md) |

_(This table will be updated as new days are added.)_

## Tools Covered

- **Terraform** — primary IaC tool used throughout this repo
- **AWS** — cloud provider used for all hands-on projects
- **Git / GitHub** — version control for both notes and Terraform code
- CI/CD tooling (to be explored in later days)

## Goals

- Build a solid, practical understanding of Terraform and IaC concepts
- Apply what I learn by building real AWS infrastructure with Terraform (e.g., a 3-tier application setup)
- Keep a running, public record of the learning process as part of my portfolio for cloud support / cloud engineer / cloud architect roles

## How to Follow Along

- Notes are organized in the `days/` folder, one file per day, numbered in order.
- Each notes file is self-contained: concepts, terminal commands used, and any diagrams for that day.
- Projects (once added) will live in the `projects/` folder, each in its own subfolder with its own Terraform code and a short README.


