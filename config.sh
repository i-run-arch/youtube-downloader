termux-setup-storage &> /dev/null
apt update && apt upgrade -y
echo "..."
echo "installing python "
pkg install python sl -y &> /dev/null
echo "..."
echo "installing youtube-dl"
pip install youtube-dl &> /dev/null 
echo "..."
echo "configuring youtube-dl"
mkdir /data/data/com.termux/files/home/storage/shared/Youtube-downloads &> /dev/null
mkdir -p ~/.config/youtube-dl &> /dev/null
touch ~/.config/youtube-dl/config &> /dev/null
echo '--no-mtime -o /data/data/com.termux/files/home/storage/shared/Youtube-downloads/%(title)s.%(ext)s -f "best[height<=1080]"' >> ~/.config/youtube-dl/config &> /dev/null
mkdir ~/bin &> /dev/null
touch ~/bin/termux-url-opener &> /dev/null 
echo 'youtube-dl $1' >> ~/bin/termux-url-opener &> /dev/null
cd ~ &> /dev/null 
echo "..."
echo "youtube-dl configured"
echo "..."
echo "Ahora sí debería estar todo correcto"
echo "..."
echo "Buen viajeeee!!"
sleep 5s
sl
sleep 2s
exit
exit
