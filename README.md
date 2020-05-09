# youtube-downloader

This is a script that installs and configure youtube-dl to download youtube videos using termux in an android device.


You can simply install this downloader by copy an pasting in termux the next line only after clean termux install (you can install it after installing other programs or repositories but I don garantize it to work beacuse it can interfer with them):

```
pkg install git -y; git clone https://github.com/i-run-arch/youtube-downloader.git; cd youtube-downloader; chmod +x config.sh; ./config.sh && exit
```

Accept the permissions and press enter if asks anything.

**Instructions of use**

After installing you can go to any youtube video in the youtube app and share it to termux, after finishing downloading the video will be in your internal storage inside the folder "Youtube-downloads"
