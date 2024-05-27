#!/bin/bash
# Update and install Apache2
apt-get update
apt-get install -y apache2

# Start and enable Apache2
systemctl start apache2
systemctl enable apache2

# Set up a simple HTML page
cat <<EOF > /var/www/html/index.html
<html>
<head>
    <title>Welcome to the start of the journey</title>
</head>
<body>
    <h1>It ends in death, but the journey is worth it</h1>
    <p>People need people - even in the times we least expect it..</p>
    <img src="AfricaPPB1" alt="Image 1">
    <img src="AfricaPPB2" alt="Image 2">
    <img src="AfricaPPB3" alt="Image 1">
    <img src="AfricaPPB4" alt="Image 2">
    <img src="AfricaPPB5" alt="Image 1">
    <p>This content is accessible only within specified networks.</p>
</body>
</html>
EOF

# [PERSONAL] Setup server or application-specific configurations
# Example: setup logs, monitoring, or other services

# Restart Apache to load new configuration
systemctl restart apache2
