# ⚙️ Automation Workflow – Smart File Organizer

## 🧩 Overview
The **Smart File Organizer** automatically manages and organizes files using Bash scripts scheduled through **cron jobs**.  
Each day at 8 PM, a cron task triggers `main.sh`, which performs all file-management operations automatically.

---

## 🧭 Workflow Steps
1. **Trigger** – The cron job runs `main.sh --all` every day at 8 PM.  
2. **Sorting Phase** – Files are organized by **type**, **date**, and **size**.  
3. **Duplicate Detection** – Finds duplicate files using MD5 checksums.  
4. **Compression** – Files older than 30 days are compressed into `backups/`.  
5. **Cleanup** – Deletes empty folders after compression.  
6. **Logging** – Every action and cron run is recorded in:
   - `logs/actions.log`
   - `logs/cron_log.txt`

---

## 🧾 Cron Job Configuration
The cron job is automatically created by `setup_cron.sh` and runs once a day:

```bash
0 20 * * * bash/Users/mandarwankhede/SmartFileOrganizer/scripts/main.sh -all >> /Users/mandarwankhede/SmartFileOrganizer/logs/cron_log.txt 2>&1
