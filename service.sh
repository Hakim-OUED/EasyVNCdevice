#!/bin/bash
#
# Activation des services au demarrage

sudo /etc/init.d/openvpn start
sudo /etc/init.d/ssh start

sudo systemctl status openvpn
sudo systemctl status ssh.service

sudo openvpn /etc/openvpn/client.conf
cvlc v4l2:///dev/video0 --sout '#transcode{vcodec=mjpg}:std{access=http{mime=multipart/x-mixed-replace;boundary=-7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=127.0.0.1:30000}'

cvlc alsa://hw:0,0 --sout='#transcode{acodec=mp3,ab=256,channels=2,samplerate=44100}:std{access=http{mime=multipart/x-mixed replace;boundary=-7b3cc56e5f51db803f790dad720ed50a},mux=mp3,dst=127.0.0.1:31000/test.mp3}' --no-sout-all --sout-keep

echo " Service Active "
