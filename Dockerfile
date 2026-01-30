# Stage 2: Serve the static files with Nginx
FROM nginx:alpine

# Add a healthcheck to ensure Nginx is serving
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl --fail http://localhost/ || exit 1

# Copy the built Hugo static files from the host into the Nginx container
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 (Nginx will listen on this port)
EXPOSE 80

# Command to run Nginx (default for nginx:alpine)
CMD ["nginx", "-g", "daemon off;"]
