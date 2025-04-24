# Use a lightweight Nginx image
FROM nginx:alpine

# Copy website files into the container
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
