termux-setup-storage 
#Asks for storage permissions

sleep 5s
apt update && apt upgrade -y 
#Updates and upgrades termux pakages

echo "..."
echo "installing python "
pkg install python -y 
#Installs python

echo "..."
echo "installing youtube-dl"
pip install youtube-dl  
#Installs youtube-dl

echo "..."
echo "configuring youtube-dl"
mkdir /data/data/com.termux/files/home/storage/shared/Youtube-downloads 
#Creates folder where the videos will be downloaded

mkdir -p ~/.config/youtube-dl  
#Creates youtube-dl config folder

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
