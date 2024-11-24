# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application files (including the Jupyter notebook)
COPY . .

# Install Jupyter and dependencies
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install jupyter

# Expose the port that Jupyter Notebook runs on
EXPOSE 8888

# Command to start Jupyter notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

