#!/bin/bash

echo "Stopping Tomcat if running..."
TOMCAT_DIR="apache-tomcat-10.1.39"
if [ -f "$TOMCAT_DIR/bin/shutdown.sh" ]; then
    sh "$TOMCAT_DIR/bin/shutdown.sh"
fi

echo "Removing Tomcat directory..."
rm -rf "$TOMCAT_DIR"

echo "Removing downloaded tar.gz..."
rm -f apache-tomcat-10.1.39.tar.gz

# Optional: Remove Java 11 if not needed
echo "Removing OpenJDK 11 (optional)..."
sudo amazon-linux-extras disable java-openjdk11
sudo yum remove -y java-11-openjdk

echo "Uninstallation complete."
