# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app/

# Install any dependencies (if you have any, update accordingly)
# If you need to install dependencies directly, you can add them here
# For example, if using `pip`:
# RUN pip install some-library-name

# Set the default command to run your app
CMD ["python", "your_script.py"]

    - name: Check build status
      if: failure()
      run: exit 1

