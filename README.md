Smart File Organizer  

### A Cross-Platform Bash Automation Tool for macOS, Linux, and Windows (Git Bash)

---

## Overview  
The *Smart File Organiser* automatically sorts, compresses, and cleans project files.  
It is fully automated with a daily *cron job* that runs every night at 8 PM.  
Developed using *Bash scripting (Linux shell)* and tested on macOS and Windows Git Bash.

---

## Features  

| Module | Description |
|:--|:--|
| Sort by Type | Groups files by extension (txt, pdf, jpg, etc.) |
| Sort by Date | Organizes files by modification date |
| Sort by Size | Separates small/medium/large files |
| Duplicate Finder | Detects duplicates using MD5 checksum |
| Compression | Archives files > 30 days old to ⁠ /backups/ ⁠ |
| Cleanup | Removes empty folders after sorting |
| Logging | Records all actions in ⁠ logs/actions.log ⁠ and ⁠ logs/cron_log.txt ⁠ |
| Cron Automation | Runs automatically every day at 8 PM |

---

## Folder Structure
SmartFileOrganizer/
├── scripts/
│ ├── main.sh
│ ├── sort_by_type.sh
│ ├── sort_by_date.sh
│ ├── sort_by_size.sh
│ ├── find_duplicates.sh
│ ├── compress_old.sh
│ ├── cleanup.sh
│ ├── logger.sh
│ └── setup_cron.sh
├── logs/
│ ├── actions.log
│ └── cron_log.txt
├── docs/
│ ├── automation.md
│ ├── automation_flow.png
│ ├── screenshots/
│ ├── final_testing.md
│ └── contribution.md
└── README.md

## Automation Flow  
At 8 PM daily, a cron job runs ⁠ main.sh --all ⁠ which calls every script in sequence:  

•⁠  ⁠Sort → Duplicate → Compress → Cleanup → Log  

![Automation Flow](docs/automation_flow.png)

---

## How to Run  

*macOS / Linux:*  
```bash
bash scripts/main.sh --all
