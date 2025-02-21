#!/bin/bash

# Ensure the script is executed with bash shell
if [ -z "$BASH_VERSION" ]; then
  echo "Please run this script using bash shell (e.g., ./logs_stats.sh)"
  exit 1
fi

# Function to display usage
usage() {
  echo "Usage: ./logs_stats.sh <log_directory> <search_string>"
}

# Check if both arguments are provided
if [ $# -ne 2 ]; then
  echo "Error: Missing arguments."
  usage
  exit 1
fi

LOG_DIR=$1
SEARCH_STRING=$2

# Verify if the provided path is valid and a directory
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory '$LOG_DIR' does not exist."
  exit 1
fi

# Display header using printf for proper formatting
printf "%-20s %-10s %-15s %-20s\n" "File Name" "File Size" "Total Lines" "Search Word Count"
printf "%-20s %-10s %-15s %-20s\n" "--------------------" "----------" "---------------" "--------------------"

# Collect data into an array for sorting
log_data=()

# Process each log file and gather statistics
for file in $(find "$LOG_DIR" -type f -name "*.log*"); do
  file_name=$(basename "$file")
  file_size=$(du -h "$file" | cut -f1)
  total_lines=$(wc -l < "$file")
  search_count=$(grep -i -c "$SEARCH_STRING" "$file")
  log_data+=("$search_count|$file_name|$file_size|$total_lines")
done

# Sort data by search count in descending order and print
for entry in $(printf "%s\n" "${log_data[@]}" | sort -t '|' -k1,1nr); do
  IFS='|' read -r search_count file_name file_size total_lines <<< "$entry"
  printf "%-20s %-10s %-15s %-20s\n" "$file_name" "$file_size" "$total_lines" "$search_count"
done