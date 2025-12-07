# !/bin/bash
version="v1.0.0"

# Build the Docker image without using cache
docker build --no-cache -t fullstack-dev-env:{version} .

# Save the Docker image to a tar file
docker save -o fullstack-dev-env_${version}.tar fullstack-dev-env:${version}