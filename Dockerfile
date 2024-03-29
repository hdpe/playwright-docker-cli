FROM mcr.microsoft.com/playwright:focal

RUN apt-get update && \
	apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg \
		lsb-release && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
		gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
	echo \
		"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
	apt-get update && \
	apt-get install -y docker-ce-cli && \
	curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
	chmod +x /usr/local/bin/docker-compose
