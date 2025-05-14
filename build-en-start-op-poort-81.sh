#!/bin/bash

# Build the Docker image
docker build -t demo-site .

# Run the container and expose port 81
docker run -d -p 81:81 --name demo-site-container demo-site

