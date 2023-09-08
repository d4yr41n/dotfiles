battery=$(cat /sys/class/power_supply/BAT0/capacity)
time=$(date +%H:%M)
volume=$(amixer get Master | tail -1 | awk '{ print $4 }' | tr -d [])
connection=$(iwctl station wlan0 show | head -7 | tail -1 | cut -b 35- | xargs)
free=$(free --mega | awk '{print $3}' | head -2 | tail -1)
used=$(free --mega | awk '{print $2}' | head -2 | tail -1)
cpu=$(top -bn 1 | awk '{print $2}' | head -3 | tail -1)
music=$(ncmpcpp --current-song "%f ")

if [ ! $connection ]
then
  network="  󰌙 "
else
  network="  󰌘 "
fi

sep=""

echo "$sep   $music$sep $network $sep  $volume $sep   $cpu $sep   $free/$used $sep 󱐋 $battery $sep $time "

