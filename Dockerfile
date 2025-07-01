# Use Nginx to serve static files
FROM nginx:stable-alpine

# Copy all your frontend files to Nginx html directory
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
