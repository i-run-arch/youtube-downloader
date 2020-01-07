termux-setup-storage &> /dev/null
apt update && apt upgrade -y &> /dev/null
pkg install python -y &> /dev/null
echo "installing youtube-dl"
pip install youtube-dl &> /dev/null 
echo "configuring youtube-dl"
mkdir ~/storage/shared/Youtube-downloads &> /dev/null
mkdir -p ~/.config/youtube-dl &> /dev/null
touch ~/.config/youtube-dl/config &> /dev/null
echo ' --no-mtime -o /data/data/com.termux/files/home/storage/shared/Youtube-downloads/%(title)s.%(ext)s-f"best[height>=1080]".avi' >> ~/.config/youtube-dl/config &> /dev/null
mkdir ~/bin &> /dev/null
touch ~/bin/termux-url-opener &> /dev/null 
echo 'youtube-dl $1' >> ~/bin/termux-url-opener &> /dev/null
echo "youtube-dl configured"

