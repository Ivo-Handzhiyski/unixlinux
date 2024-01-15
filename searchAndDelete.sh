#!/bin/bash

# Define variables
size=0
date=""
files=""

# Menu
while :; do
    clear
    # Main menu for choosing what you want to do
    echo "File Search"
    echo "----------------"
    echo "1. Enter size"
    echo "2. Enter date"
    echo "3. Delete"
    echo "4. Exit"
    read -p "Select an option (1-4): " option

    case $option in
    1)
        # Getting the wanted size later to be searched
        read -p "Enter file size (in bytes): " size
        files=$(find . -size +$size)

        # Print files to screen
        echo "Files with size at least $size bytes:"
        for file in $files; do
            echo $file
        done
        ;;
    2)
        # Getting the wanted date later to be searched
        read -p "Enter file date (YYYY-MM-DD): " date
        files=$(find . -newermt $date)

        # Print files to screen
        echo "Files created after $date:"
        for file in $files; do
            echo $file
        done
        ;;
    3)
        # Ask for confirmation before deleting files
        read -p "Do you want to delete these files? (yes/no): " answer

        if [[ $answer == "yes" ]]; then
            # Delete files
            for file in $files; do
                rm -f $file
            done
            echo "Files were successfully deleted!"
        else
            echo "Files were not deleted!"
        fi
        ;;
    4)
        # Add a sleep command to pause for 3 seconds
        sleep 3
        exit 0
        ;;
    *)
        echo "Invalid option!"
        ;;
    esac

    # Add a sleep command to pause for 3 seconds
    sleep 3
done
