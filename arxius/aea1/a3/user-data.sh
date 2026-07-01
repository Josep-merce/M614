#!/bin/bash
# Script d'arrencada de la instància EC2 (Amazon Linux 2023)
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Servidor web a EC2 — AEA1 · [COGNOM]</h1>" > /var/www/html/index.html