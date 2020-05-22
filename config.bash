#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage
sleep 10s

apt update && apt upgrade -y

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
#!/data/data/com.termux/files/usr/bin/bash
URL="\$1"

#force audio unless specified in read line below.
if [[ -z "\$2" ]]; then
    yesvideo=2
else
    yesvideo=1
fi

# functions
dl_youtube ()
{
    cd ~/storage/shared/Youtube || exit
    #for options to download video, uncomment the below line
    #read -p \$'Download video or only audio \n(Select the number and press return) \n 1) Video \n 2) Audio only \n' yesvideo
    if [[ "\$yesvideo" == 1 ]]; then
        youtube-dl "\$URL"
    elif [[ "\$yesvideo" == 2 ]]; then
        echo "attempting to download the Best audio"
        # change webm to m4a to not download opus
        youtube-dl -f 'bestaudio[ext=m4a]' "\$URL"
    else
        echo "something went wrong and downloading video. Press ctrl+c to cancel."
        youtube-dl "\$URL"
    fi
}

echo "Cracking open the internets"


case "\$URL" in
    *youtu.be*)
        dl_youtube
        ;;
    *youtube.com*)
        dl_youtube
        ;;
    *)
        echo "something is wrong. Just grabbing the url with curl"
        cd ~/storage/shared/Download || exit
        curl -O "\$URL"
        ;;
esac
read -n 1 -s -p "Press any key to exit... good luck finding it."
EOF

echo "Downloading test video. May 3, 2020AM service."
youtube-dl https://youtu.be/52k3IzIFnGQ

echo "there is no process for detecting errors here. What you see is what you get."
read -n 1 -s -p "Press any key to exit..."
