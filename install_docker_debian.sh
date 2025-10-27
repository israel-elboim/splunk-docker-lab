#!/bin/bash

# ==============================================================================
# Title: Docker & Docker Compose Installer for Kali Linux / Debian
# Description: This script automates the installation of Docker Engine
#              and the Docker Compose plugin on a fresh Kali/Debian system.
# Author: Israel Elboim
#
# Usage:
# 1. Make the script executable: chmod +x install_docker_debian.sh
# 2. Run with sudo: ./install_docker_debian.sh
# 3. !! IMPORTANT: Log out and log back in after running. !!
# ==============================================================================

set -e # Exit immediately if a command exits with a non-zero status.

# --- Functions for pretty output ---
print_info() {
    echo -e "\n[INFO] $1"
    echo "-----------------------------------------"
}

print_success() {
    echo -e "\n[SUCCESS] $1"
    echo "========================================="
}

print_error() {
    echo -e "\n[ERROR] $1" >&2
    echo "========================================="
    exit 1
}

# 1. Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    print_error "This script must be run as root or with sudo."
fi

print_info "Starting Docker installation process for Kali/Debian..."

# 2. Update package lists and install prerequisites
print_info "Updating package lists and installing prerequisites..."
apt-get update
apt-get install -y ca-certificates curl gnupg

# 3. Add Docker's official GPG key
print_info "Adding Docker's GPG key..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# 4. Set up the Docker repository
print_info "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  bookworm stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Update package lists again (to include Docker repo)
print_info "Updating package lists..."
apt-get update

# 6. Install Docker Engine, CLI, and Compose plugin
print_info "Installing Docker Engine, CLI, and Compose plugin..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

print_success "Docker installation complete."

# 7. Add current user to the 'docker' group
# This allows running 'docker' commands without 'sudo'
if [ -n "$SUDO_USER" ]; then
    print_info "Adding user '$SUDO_USER' to the 'docker' group..."
    usermod -aG docker "$SUDO_USER"
    print_success "User '$SUDO_USER' added to 'docker' group."
    print_info "!!! IMPORTANT !!!"
    print_info "You must LOG OUT and LOG BACK IN for this change to take effect."
else
    print_info "Could not find SUDO_USER. Please add your user to the 'docker' group manually:"
    print_info "sudo usermod -aG docker <your-username>"
fi

print_success "Setup finished."
