FROM nginx:alpine

# Copy all static files to nginx html directory
COPY . /usr/share/nginx/html

# Expose port 8080 (OpenShift doesn't allow port 80)
EXPOSE 8080

# Run nginx on port 8080
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf && \
    sed -i 's/listen  \[::\]:80;/listen  [::]:8080;/' /etc/nginx/conf.d/default.conf && \
    chmod -R g+rwX /var/cache/nginx /var/run /var/log/nginx && \
    chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx

USER nginx

CMD ["nginx", "-g", "daemon off;"]
