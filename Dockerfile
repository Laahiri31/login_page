# Use an official Nginx image to serve the static files
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy all files from the current directory to the container
COPY . .

# Expose port 80
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]

