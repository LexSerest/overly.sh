# overly.sh
A small script using OverlayFS for use in the cache and in the profile of the Google Chrome browser


## Example a of bash script to run Google Chrome
```bash
#!/bin/bash

overly mount
google-chrome-stable $1 $2 $3

if ! pgrep -x "chrome" > /dev/null
then 
    echo "sync..."
    overly sync
    overly umount
fi
```
