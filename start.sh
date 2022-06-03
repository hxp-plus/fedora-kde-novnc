#!/bin/bash
echo "Set noVNC password: $VNCPASSWD"
echo "$VNCPASSWD" | vncpasswd -f > /root/.vnc/passwd
vncserver :1
cd /etc/pki/tls/certs
openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/pki/tls/certs/novnc.pem -out /etc/pki/tls/certs/novnc.pem -days 365 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"
websockify --web=/usr/share/novnc/ --cert=/etc/pki/tls/certs/novnc.pem 6080 localhost:5901
