FROM php:7.4-apache

# 2. Set the working directory inside the container
WORKDIR /var/www/html

# 3. Copy the contents of your local repository to the container
COPY . .

# 4. Install dependencies (e.g., PHP extensions, MySQL, etc.)
RUN apt-get clean && apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install -v gd mysqli

# 5. Expose the container's port (default for DVWA is 80)
EXPOSE 80

# 6. Set environment variables or other configurations
ENV MYSQL_ROOT_PASSWORD=dvwa

# 7. Command to run when the container starts (Apache server)
CMD ["apache2-foreground"]
