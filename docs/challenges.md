
  ⁠*Problem:* macOS uses BSD utils (e.g., ⁠ stat ⁠/⁠ md5 ⁠) while Linux uses GNU utilities (⁠ stat -c%s ⁠, ⁠ md5sum ⁠).
•⁠  ⁠*Solution:* Implemented portable header ⁠ checksum_for() ⁠ and ⁠ filesize_for() ⁠ that use ⁠ md5 -q ⁠, ⁠ md5sum ⁠, ⁠ shasum ⁠, and ⁠ wc -c ⁠ respectively.

⁠*Problem:* Scripts failed when run from different working directories.
•⁠  ⁠*Solution:* Introduced ⁠ SCRIPT_DIR ⁠ & ⁠ PROJECT_DIR ⁠ variables at top of each script to build absolute script paths.
*Problem:* Cron uses a minimal environment and sometimes cron daemon is not enabled.
•⁠  ⁠*Solution:* Wrote ⁠ scripts/setup_cron.sh ⁠ that uses absolute paths; provided instructions to enable cron on macOS.
⁠*Problem:* Naive duplicate check would re-hash files repeatedly.
•⁠  ⁠*Solution:* Used associative array ⁠ seen[checksum]=path ⁠ to detect duplicates in one pass, preserved checksums in ⁠ duplicates.txt ⁠.
