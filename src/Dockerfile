# Specify the platform for the base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt first to install dependencies
COPY requirements.txt .

# Install dependencies from the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app files
COPY . .

# Expose port 5000
EXPOSE 5000

# Command to run the FastAPI application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]




# # Use the official Node.js image as the base image
# FROM node:18-alpine

# # Set the working directory in the container
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json into the working directory
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code into the working directory
# COPY . .

# # Expose port 5000
# EXPOSE 5000

# # Start the application
# CMD ["node", "server.js"]
