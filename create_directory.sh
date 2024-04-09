#!/bin/bash

# Check if the number of arguments provided is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <number_of_directories> <main.tf_path>"
    exit 1
fi

# Extract arguments
num_directories=$1
main_tf_path=$2

# Check if the main.tf file exists
if [ ! -f "$main_tf_path" ]; then
    echo "Error: main.tf file not found at '$main_tf_path'"
    exit 1
fi

# Loop to create directories and copy main.tf into each directory
for ((i=0; i<=num_directories; i++)); do
    directory_name="test$i"
    mkdir -p "$directory_name" || { echo "Error creating directory $directory_name"; exit 1; }
    cp "$main_tf_path" "$directory_name/main.tf" || { echo "Error copying main.tf to $directory_name"; exit 1; }
    echo "main.tf copied to $directory_name"
done

echo "Directories and main.tf files created successfully."