termux-setup-storage

sleep 5s
apt update && apt upgrade -y
pkg install wget curl python ffmpeg -y
pip install youtube-dl


if [[ ! -d /data/data/com.termux/files/home/storage/shared/Youtube ]]; then
    mkdir -p /data/data/com.termux/files/home/storage/shared/Youtube
fi
if [[ ! -d ~/.config/youtube-dl ]]; then
    mkdir -p ~/.config/youtube-dl
fi

cat >~/.config/youtube-dl <<EOF
  -o /data/data/com.termux/files/home/storage/shared/Youtube-downloads/%(title)s.%(ext)s -f "best[height<=1080]"
EOF

echo '--no-mtime -o /data/data/com.termux/files/home/storage/shared/Youtube-downloads/%(title)s.%(ext)s -f "best[height<=1080]"' >> ~/.config/youtube-dl/config
#Creates config file for youtube-dl in "[height<=1080]" 1080 can be replace for any other resolution, this will set the maximum resolution available that will be downloaded

mkdir ~/bin
#Creates bin foler for termux-url-opener

echo 'youtube-dl $1' >> ~/bin/termux-url-opener
#Creates file to open youtube links by directly sharing with termux app

cd ~
echo "..."
echo "youtube-dl configured"
echo "Downloading test video"
youtube-dl https://www.youtube.com/watch?v=dQw4w9WgXcQ
#Downloads Rick Atley's Never gonna Give you Up

echo "..."
echo "Everything should be working now"
echo "Have fun!"
sleep 1s
