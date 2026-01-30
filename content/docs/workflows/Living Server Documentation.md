---
title: "Creating Living Server Documentation: An Automated Workflow"
date: 2026-01-29
draft: false
---

## The Never-Ending Quest for Current Documentation

Over the year 2025, my server had ongoing developments, and my AI counterpart routinely had outdated information about the server and it continuously had to run commands to find current information. I manually kept compiling it all into one huge server document, comprehensive and unnecessarily long so it ruined context windows.

Finally I got smart, used a million year old technology and cronjob'd some scripts. The script outputs several different files so the AI can scan the directory and find relevant information quickly and efficiently.

At the heart of this workflow are two key scripts, a cron job, and goose cli that bring this "living" documentation to life.

## The Core: `generate_server_doc.sh`

The foundation of this workflow is a comprehensive shell script, `generate_server_doc.sh`, that runs daily via a cron job. 

Here's the peek at the cron job that kicks things off every morning at 3:00 AM:

```bash
0 3 * * * /home/john/server-docs/generate_server_doc.sh &> /dev/null
```

Before generating the new files, the script archives the previous day's documentation, creating a historical record that we'll leverage later. This results in a clean and organized structure:

```
/home/john/server-docs/
├── archives/
│   ├── 20260127-0300/
│   │   ├── README.md
│   │   ├── network_configuration.md
│   │   └── ... (all other docs from this day)
│   └── 20260128-0300/
│       ├── README.md
│       └── ...
└── current/
    ├── README.md
    ├── ai_agent_integration.md
    ├── backup_disaster_recovery.md
    ├── introduction.md
    ├── monitoring_maintenance.md
    ├── network_configuration.md
    ├── security_practices.md
    ├── server_specifications.md
    └── software_versions.md
```

### Chunked for Clarity and Search

A key design choice was to not dump everything into one massive file. Instead, the script chunks the documentation into logical, digestible sections. This is crucial for usability. When I need to check my firewall rules, I can open `security_practices.md`. If I need to see the running Docker containers, I can jump straight into `network_configuration.md`. This approach makes the documentation incredibly easy to navigate and, more importantly, **searchable**. Using simple tools like `grep` or `rg` to find specific information becomes trivial.

The script gathers a wealth of information into these sections, including:

*   **Server Specifications:** OS, kernel version, uptime, CPU, RAM, and disk usage.
*   **Software Versions:** Docker, Docker Compose, Python, Node.js, and other critical software.
*   **Network Configuration:** IP addresses, routing tables, firewall rules, and a list of running Docker containers.
*   **Security Snapshots:** A list of user accounts, sudoers configuration, and the latest entries from key security logs.

## Proactive Monitoring with `doc_integrity_check.sh`

Generating documentation is one thing, but I am not actively monitoring each new creation. Nor do I want to. I want the up-to-date information at my fingertips and I want differences logged and analyzed in the background, surfacing critical differences and analysis of those differences.

That's where `doc_integrity_check.sh` starts the next piece of the workflow. This script runs after the documentation is generated and compares the new "current" state with the most recent "archive."

It's not just a simple file comparison. It's a targeted integrity check that looks for specific, meaningful changes:

*   **Docker Container Status:** Has a container unexpectedly stopped or started? The script will flag it. This has been invaluable for catching services that have failed overnight.
*   **New Security Red Flags:** The script actively scans the security log snapshots for new "ERROR," "FAILED," or "CRITICAL" entries. This provides an early warning system for potential security issues.

All findings are logged to `/var/log/goose_doc_integrity.log`, creating a running commentary on the health and status of my server.

## The Goose Skill: Interpreting the Data

This is the living part. Everything to this point is just predefined scripts. I have a goose skill that is configured to read and interpret the `goose_doc_integrity.log` file. I can simply ask goose, "What's the latest on the server documentation?" and it will parse the log and give me a human-readable summary of any changes or warnings. It's brought my year-long pursuit of a SysAdmin Agent to fruition.

Monitoring aside, the server document(s) itself has a table of contents that directs agents to the exact file. My goose workspace has common paths in memory, and updates memory based on the server document. If goose asks for information about my server, anything from hardware to software, it's in my server documentation.

If goose assigns a port in a docker config, I tell it to check ports in server docs and it corrects itself, spins up the docker, then later that night that port is added to the server doc via the script.

## Conclusion: A Workflow That Works for You

This automated documentation and monitoring system has been a game-changer for me. It's a low-maintenance, high-reward workflow that provides peace of mind and a crystal-clear, searchable view of my server's configuration. It's a testament to the power of simple scripts, cron jobs, and a little AI layer to monitor existing technologies. It's not overly complex and it leverages all technologies from pre-historic scripts to 21st century AI.

I don't remember where anything is, it's all externalized and I just have to periodically check integrity- trust but verify. IP addresses, site configuration files, docker-compose.yml files, cloudflare, hardware data, SMART data, databases, backups, random files, all pertinent file paths are saved.

The next steps are to refine the goose skill to provide more detailed analysis and to perhaps add more integrity checks to the monitoring script. But even in its current state, it's a workflow that I can rely on, and one that I hope inspires you to automate your own documentation headaches.
