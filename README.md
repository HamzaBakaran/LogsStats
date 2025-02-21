
# Log Statistics Bash Script

## 📜 Description

This script, `logs_stats.sh`, analyzes log files and provides statistics based on a search term. 

It displays:
- File name
- File size (human-readable)
- Total number of lines
- Count of lines containing the specified search word

The results are sorted by the count of search word occurrences in descending order.

---
## ⚙️ Requirements

- Run the script using the Bash shell.
- Provide two arguments: log directory and search string.
- The script will display an error if:
  - Arguments are missing
  - The directory does not exist
  - The script isn't run using Bash

---

## 🚀 Usage

### Command Syntax
```
./logs_stats.sh <log_directory> <search_string>
```

### Arguments:
- `<log_directory>`: Path to the directory containing `.log` files (e.g., `/tmp/logs`).
- `<search_string>`: Term to search for within the logs (e.g., `"Chrome/"`, `"Mozilla/"`, `"Safari/"`).

### Example:
```
./logs_stats.sh /tmp/logs "Chrome/"
```

---



## ✅ Output Example

```
File Name            File Size  Total Lines     Search Word Count   
-------------------- ---------- --------------- --------------------
access.log.1         101M       715760          70980               
access.log           101M       557097          88835               
access.log.15        101M       461866          94946               
```

---
