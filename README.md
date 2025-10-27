Splunk Docker LabA simple, one-command project to spin up a persistent Splunk Enterprise server using Docker Compose. Ideal for learning, testing, and cybersecurity lab environments.This setup uses the official Splunk image and includes persistent storage, so your data and configurations will be saved even after you stop or restart the container.FeaturesOne-Command Setup: Get Splunk running with docker compose up -d.Persistent Storage: Uses Docker Volumes to save your data (/opt/splunk/etc and /opt/splunk/var).Latest Version: Pulls the latest official image from Splunk.Cross-Platform: Works on Windows, macOS, and Linux (anywhere Docker is installed).PrerequisitesYou must have Docker and Docker Compose installed on your system.Windows / macOS:Download and install Docker Desktop. It includes both Docker and Docker Compose.Linux (Ubuntu / Debian / Kali):Docker is not pre-installed. You can use one of the included setup scripts.For Ubuntu: Use the install_docker_ubuntu.sh script.For Debian or Kali Linux: Use the install_docker_kali.sh script.How to run (example for Ubuntu):# 1. Give the script execution permissions
chmod +x install_docker_ubuntu.sh

# 2. Run the script with sudo
sudo ./install_docker_ubuntu.sh

# 3. !!! IMPORTANT !!!
# After the script finishes, you MUST log out and log back in
# for the user group changes to take effect.
How to Use1. Get the Project FilesYou have two options to get the files:Option A: Download ZIP (The Simple Way)Go to the main page of this repository on GitHub.Click the green <> Code button.Select Download ZIP.Unzip the downloaded file to a folder on your computer.Option B: Git Clone (The Pro Way)Clone this repository to your local machine:git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git
(Remember to replace the URL with your own)2. Navigate to the Directorycd YOUR_REPOSITORY_NAME
(If you downloaded the ZIP, navigate to the unzipped folder)3. (Important!) Edit the PasswordBefore you start, open the docker-compose.yml file and change the password on this line:- SPLUNK_PASSWORD: YourSecurePasswordHere
4. Start the Splunk ServerRun the following command from your terminal:docker compose up -d
This will download the Splunk image (on the first run) and start the container in detached mode (-d).5. Wait and AccessWait about 1-2 minutes for the Splunk service to fully initialize inside the container.You can then access the Splunk Web UI in your browser at:http://localhost:8000Username: adminPassword: The password you set in the docker-compose.yml file.How to StopTo stop and remove the Splunk container, run the following command from the same directory:docker compose down
Your data will be safe in the Docker volumes, ready for the next time you run docker compose up.
