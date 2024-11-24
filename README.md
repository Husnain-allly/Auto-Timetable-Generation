# Auto-Timetable-Generation

## Description

The Auto-Timetable-Generation project is focused on creating an optimized weekly timetable using a genetic algorithm (GA). The GA is a popular optimization method that mimics the process of natural evolution to improve a solution iteratively. In this case, the goal is to generate an optimal timetable for courses, professors, and rooms, taking into account various constraints such as time clashes, room availability, and professor schedules.

## Features

- **Genetic Algorithm:** The core algorithm evolves the population of timetables over generations to achieve the best fitness score.
- **Binary Encoding:** Each timetable's data, such as professor assignments, room allocations, and time slots, is encoded using binary values.
- **Fitness Calculation:** The fitness score evaluates the quality of the timetable based on constraints like course clashes, room availability, and professor schedules.
- **Output:** The program prints the best timetable generated after all iterations, showing the day, time, course, professor, and room assignments.

## Usage

To run the code, execute the cells in the Jupyter notebook. The output will display the best timetable configuration after completing the genetic algorithm's evolution process.

## Dependencies

- Python 3.11.4
- Jupyter Notebook

## Notes

- The code is structured to allow easy modification of parameters like the number of generations, population size, and time slots.
- The project is a proof of concept and may require further adjustments for real-world applications.

---

## Docker Image Creation & GitHub Actions for Deployment

### 1. **Dockerfile Creation**

A **Dockerfile** is used to define the environment required to run the timetable generation code. It ensures that all dependencies are installed and the correct environment is set up to execute the program.

```dockerfile
# Use Python as base image
FROM python:3.9-slim

# Set working directory in container
WORKDIR /app

# Copy the project files into the container
COPY . /app/

# Install necessary Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python", "main.py"]
```
## 2. GitHub Actions Workflow (YAML file)

The GitHub Actions workflow automates the process of building the Docker image and pushing it to Docker Hub. A YAML file defines the steps that GitHub Actions will take when the workflow is triggered.

### Sample GitHub Actions Workflow:
```yaml
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v1

    - name: Cache Docker layers
      uses: actions/cache@v2
      with:
        path: /tmp/.buildx-cache
        key: ${{ runner.os }}-buildx-${{ github.sha }}
        restore-keys: |
          ${{ runner.os }}-buildx-

    - name: Log in to Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Build and Push Docker image
      uses: docker/build-push-action@v4
      with:
        context: .
        file: ./Dockerfile
        push: true
        tags: your-dockerhub-username/timetable-generator:latest
```

## Explanation of Each Step:

- **Trigger (on push to main branch):** The workflow is triggered every time code is pushed to the `main` branch.
- **Checkout code:** The first step checks out the code from the GitHub repository so that Docker can use the project files to build the image.
- **Set up Docker Buildx:** Docker Buildx is a tool for building multi-platform Docker images. This step sets up Docker Buildx, allowing us to build images efficiently.
- **Cache Docker layers:** Docker images are built in layers, and some layers don’t change often (like installing dependencies). This step caches these layers to speed up subsequent builds, reducing build times.
- **Log in to Docker Hub:** This step logs into Docker Hub using credentials stored in GitHub's Secrets (`DOCKER_USERNAME` and `DOCKER_PASSWORD`). This is essential for pushing the Docker image to your Docker Hub repository.
- **Build and Push Docker Image:** The `docker/build-push-action@v4` action is responsible for building the Docker image based on the provided Dockerfile. It uses the project directory (`.`) and Dockerfile (`./Dockerfile`) to build the image. The image is tagged with `your-dockerhub-username/timetable-generator:latest` and pushed to Docker Hub for storage and later use.

## Conclusion

By following the steps above, the project automates the process of building a Docker image for the Auto-Timetable-Generation program and pushing it to Docker Hub using GitHub Actions. This setup ensures a consistent, reproducible environment for running the timetable generation algorithm while also enabling easy deployment and sharing of the image across different systems and users.

