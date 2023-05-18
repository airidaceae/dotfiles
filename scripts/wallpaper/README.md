# Roux's Wallpaper Daemon
a deamon that listens on a fifo channel located at FIFO_PATH.
The daemon listens for 'rand' 'next' and 'prev' and upon recieving this it will
choose a random wallpaper, go the the next wallpaper (as sorted by find -L) or
go to the previous wallpaper. it does NOT go to the last randomly selected 
wallpaper, just the previous one in the wallpaper path
