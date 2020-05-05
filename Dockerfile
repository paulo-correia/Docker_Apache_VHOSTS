# Use an official Alpine Linux as a parent image
FROM alpine:latest

# Install or Update Apache
RUN apk --update add apache2

# Copy httpd.conf the current directory contents into the container at /etc/apache2
COPY vhosts.conf /etc/apache2/conf.d

# Create sample "user" dir
# Create sample log dir
# Create sample html dir
# Create index.html on sample html dir
# Create other "user" dir
# Create other log dir
# Create other html dir
# Create index.html on other html dir
# Change "It Works!" on /var/www/localhost/htdocs/index.html
RUN mkdir /var/www/localhost/htdocs/sample && \
    mkdir /var/www/localhost/htdocs/sample/log && \
    mkdir /var/www/localhost/htdocs/sample/html && \
    mkdir /var/www/localhost/htdocs/other && \
    mkdir /var/www/localhost/htdocs/other/log && \
    mkdir /var/www/localhost/htdocs/other/html && \
    echo "<h1>SAMPLE - VHOSTS on Docker</h1>" > /var/www/localhost/htdocs/sample/html/index.html && \
    echo "<h1>OTHER - VHOSTS on Docker</h1>" > /var/www/localhost/htdocs/other/html/index.html && \
    sed -i  's/It works!/It works on Docker VHOSTS!/g' /var/www/localhost/htdocs/index.html

# Make port 80 available to the world outside this container
EXPOSE 80

# Run httpd service when the container launches
CMD ["httpd", "-D", "FOREGROUND"]