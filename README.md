# Splunk Docker Lab

A simple, one-command project to spin up a persistent Splunk Enterprise server using Docker Compose. Ideal for learning, testing, and cybersecurity lab environments.

This setup uses the official Splunk image and includes persistent storage, so your data and configurations will be saved even after you stop or restart the container.

## Features

- **One-Command Setup**: Get Splunk running with `docker compose up -d`
- **Persistent Storage**: Uses Docker Volumes to save your data (`/opt/splunk/etc` and `/opt/splunk/var`)
- **Latest Version**: Pulls the `latest` official image from Splunk
- **Cross-Platform**: Works on Windows, macOS, and Linux (anywhere Docker is installed)

## Prerequisites

You must have **Docker** and **Docker Compose** installed on your system.

### Installation Guide

- **Windows / macOS**: Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop). It includes both Docker and Docker Compose.

- **Linux (Ubuntu / Debian / Kali)**: Docker is not pre-installed. You can use one of the included setup scripts:
  - For **Ubuntu**: Use the `install_docker_ubuntu.sh` script
  - For **Debian** or **Kali Linux**: Use the `install_docker_debian.sh` script

#### How to run the installation script (example for Ubuntu):

```bash
# 1. Give the script execution permissions
chmod +x install_docker_ubuntu.sh

# 2. Run the script with sudo
sudo ./install_docker_ubuntu.sh

# 3. !!! IMPORTANT !!!
# After the script finishes, you MUST log out and log back in
# for the user group changes to take effect.
```

## How to Use

### 1. Get the Project Files

You have two options to get the files:

#### Option A: Download ZIP (The Simple Way)

1. Go to the main page of this repository on GitHub
2. Click the green `<> Code` button
3. Select **Download ZIP**
4. Unzip the downloaded file to a folder on your computer

#### Option B: Git Clone (The Pro Way)

Clone this repository to your local machine:

```bash
git clone https://github.com/israel-elboim/splunk-docker-lab.git
```

### 2. Navigate to the Directory

```bash
cd splunk-docker-lab
```

(If you downloaded the ZIP, navigate to the unzipped folder)

### 3. ⚠️ Edit the Password (Important!)

Before you start, open the `docker-compose.yml` file and change the password on this line:

```yaml
- SPLUNK_PASSWORD=YourSecurePasswordHere
```

### 4. Start the Splunk Server

Run the following command from your terminal:

```bash
docker compose up -d
```

This will download the Splunk image (on the first run) and start the container in detached mode (`-d`).

### 5. Wait and Access

Wait about **1-2 minutes** for the Splunk service to fully initialize inside the container.

You can then access the Splunk Web UI in your browser at:

🌐 **http://localhost:8000**

**Login Credentials:**
- Username: `admin`
- Password: The password you set in the `docker-compose.yml` file

## How to Stop

To stop and remove the Splunk container, run the following command from the same directory:

```bash
docker compose down
```

Your data will be safe in the Docker volumes, ready for the next time you run `docker compose up`.

## Troubleshooting

- If you can't access the web interface, wait a bit longer (Splunk can take 2-3 minutes on slower systems)
- Check if the container is running: `docker ps`
- View container logs: `docker compose logs`

## License

This project uses the official Splunk Docker image. Please refer to [Splunk's licensing terms](https://www.splunk.com/en_us/legal/splunk-software-license-agreement.html).

---

**Happy Splunking! 🔍**
