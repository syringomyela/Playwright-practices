# Use official Jenkins image as the base
FROM jenkins/jenkins:lts

# Switch to root user to install dependencies
USER root

# Install Node.js (LTS version) and dependencies
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs apt-transport-https \
    && npm install -g npm@latest

# Install Playwright dependencies and browsers
RUN npm install -g playwright@latest \
    && playwright install --with-deps

# Set permissions for Jenkins user
RUN chown -R jenkins:jenkins ./tests

# Switch back to Jenkins user
USER jenkins

# Default Jenkins port
EXPOSE 8080
