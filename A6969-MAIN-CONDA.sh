#!/bin/bash

# Function to check if conda is installed
check_conda() {
    if ! command -v conda &> /dev/null
    then
        echo "404: conda not found"
        exit 1
    fi
}

# Function to display the list of conda environments
list_envs() {
    check_conda
    echo "List of conda environments:"
    conda env list
}

# Function to create a new conda environment
create_env() {
    check_conda
    read -p "Enter environment name: " env_name
    conda create --name $env_name
    echo "Environment $env_name created successfully!"
}

# Function to delete an existing conda environment
delete_env() {
    check_conda
    read -p "Enter environment name: " env_name
    conda env remove --name $env_name
    echo "Environment $env_name deleted successfully!"
}

# Function to display information about a conda environment
info_env() {
    check_conda
    read -p "Enter environment name: " env_name
    conda info --envs | grep $env_name
}

# Main menu
while true; do
    echo "Conda Environment Manager"
    echo "1. List environments"
    echo "2. Create environment"
    echo "3. Delete environment"
    echo "4. Info environment"
    echo "5. Exit"
    read -p "Enter your choice [1-5]: " choice

    case $choice in
        1) list_envs ;;
        2) create_env ;;
        3) delete_env ;;
        4) info_env ;;
        5) exit 0 ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done
