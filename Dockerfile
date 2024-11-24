# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app/

# Install any necessary dependencies (if you have any, you can specify them here)
# If you don't have a requirements.txt, you can install dependencies manually, e.g.:
# RUN pip install some-library-name

# Run the application (adjust based on your app's entry point)
CMD ["python", "your_script.py"]
