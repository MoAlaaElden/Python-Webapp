# https://docs.docker.com/engine/install/debian/
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# Install the Docker packages.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
# Check the status of Docker Engine
sudo service docker restart
sudo service docker status
# Add User to Docker group
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 666 /var/run/docker.sock
# Link Docker Compose to the executable and grant execution permissions
sudo ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/bin/docker-compose
sudo chmod u+x /usr/bin/docker-compose
