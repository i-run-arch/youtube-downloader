#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage
sleep 10s

pkg update && pkg upgrade -y

pkg install wget curl python ffmpeg -y

pip install youtube-dl

if [[ ! -d /data/data/com.termux/files/home/storage/shared/Youtube ]]; then
    mkdir -p /data/data/com.termux/files/home/storage/shared/Youtube
fi
if [[ ! -d ~/.config/youtube-dl ]]; then
    mkdir -p ~/.config/youtube-dl
fi
if [[ ! -d /data/data/com.termux/files/home/bin ]]; then
    mkdir -p ~/bin
fi

#This configures the default actions of youtube-dl
cat >~/.config/youtube-dl/config <<EOF
  -o /data/data/com.termux/files/home/storage/shared/Youtube/%(title)s.%(ext)s -f "best[height<=480]"
EOF

cat >~/bin/termux-url-opener <<EOF

echo "Downloading test video. May 3, 2020AM service."
youtube-dl https://youtu.be/52k3IzIFnGQ

echo "there is no process for detecting errors here. What you see is what you get."
read -n 1 -s -p "Press any key to exit..."
