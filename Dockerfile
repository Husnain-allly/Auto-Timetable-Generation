# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy only requirements.txt first to take advantage of Docker cache
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install jupyter

# Copy the rest of the application files (including Jupyter notebook)
COPY . .

# Expose the port that Jupyter Notebook runs on
EXPOSE 8888

# Command to start Jupyter notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
