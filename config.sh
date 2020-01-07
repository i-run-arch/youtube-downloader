termux-setup-storage
apt update && apt upgrade -y
pkg install python -y
pip install youtube-dl
mkdir ~/storage/shared/Youtube
mkdir -p ~/.config/youtube-dl
touch ~/.config/youtube-dl/config
echo ' --no-mtime -o /data/data/com.termux/files/home/storage/shared/Youtube/%(title)s.%(ext)s-f"best[height>=1080]".avi' >> ~/.config/youtube-dl/config
mkdir ~/bin
touch ~/bin/termux-url-opener
echo 'youtube-dl $1'
