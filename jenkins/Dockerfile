FROM jenkins/jenkins:lts

USER root

RUN apt-get update

# Docker CLI telepítése
RUN apt-get install -y ca-certificates curl gnupg2

RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to APT sources
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y docker-ce-cli

# Create the docker group
RUN groupadd -f docker

# Add jenkins user to the docker group
RUN usermod -aG docker jenkins

# Install sudo if not already present
RUN apt-get update && apt-get install -y sudo

# Allow jenkins user to run specific commands with sudo without password
RUN echo "jenkins ALL=(ALL) NOPASSWD: /usr/bin/chown" >> /etc/sudoers.d/jenkins

# Set up entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Switch to jenkins user
USER jenkins

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
