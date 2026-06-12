FROM php:8.2-apache

# Enable mod_rewrite (needed for .htaccess in pedidos/)
RUN a2enmod rewrite

# Ensure the writable directories exist even if empty in the Git repo
# (Git does not track empty directories)
RUN mkdir -p /var/www/html/pedidos /var/www/html/admin

# Copy all project files to Apache web root
COPY . /var/www/html/

# Set correct permissions for writable directories
# These will be persisted via Render Disks
RUN chown -R www-data:www-data /var/www/html/pedidos /var/www/html/admin

# Expose HTTP port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
