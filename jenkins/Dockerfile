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

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl wget gnupg apt-transport-https \
  libasound2 libatk-bridge2.0-0 libgtk-3-0 \
  libxss1 libnss3 libxshmfence1 libgbm1 \
  libxdamage1 libxcomposite1 libxcursor1 \
  libxi6 libxtst6 libxrandr2 libatk1.0-0 \
  fontconfig locales

# Install Google Chrome (modern method, no apt-key)
RUN mkdir -p /etc/apt/keyrings && \
    wget -q -O /etc/apt/keyrings/google-chrome.gpg https://dl.google.com/linux/linux_signing_key.pub && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" \
      > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable

# Increase /dev/shm (Chrome needs more shared memory)
RUN mkdir -p /dev/shm && chmod 1777 /dev/shm

# Set custom environment identifier for Jenkins during tests
ENV PRFQ_JENKINS=true

# Switch to jenkins user
USER jenkins

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
