#!/bin/bash
set -euxo pipefail

dnf install -y httpd
cat > /var/www/html/index.html <<'HTML'
<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><title>Project 1</title></head>
<body><h1>Project 1: Terraform web server</h1><p>Apache is running on Amazon EC2.</p></body>
</html>
HTML
systemctl enable --now httpd
