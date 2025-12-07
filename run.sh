# !/bin/bash
version="v1.0.0"

# Build the Docker image without using cache
docker build --no-cache -t fullstack-dev-env:{version} .

# Save the Docker image to a tar file
docker save -o fullstack-dev-env_${version}.tar fullstack-dev-env:${version}

# ======================================================
# docker login
docker login

# tag the image
docker tag fullstack-dev-env:${version} your_dockerhub_username/fullstack-dev-env:${version}

# push the image to Docker Hub
docker push your_dockerhub_username/fullstack-dev-env:${version}

# Docker run
docker run -it --name fullstack-dev-container --restart unless-stopped -v ~/workspace:/workspace -u $(id -u):$(id -g) fullstack-dev-env:${version}