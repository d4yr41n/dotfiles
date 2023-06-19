battery=$(cat /sys/class/power_supply/BAT0/capacity)
time=$(date +%H:%M)
volume=$(echo "$(echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@) | cut -b 9-) * 100" | bc)
connection=$(iwctl station wlan0 show | head -7 | tail -1 | cut -b 35- | xargs)
free=$(free --mega | awk '{print $3}' | head -2 | tail -1)
used=$(free --mega | awk '{print $2}' | head -2 | tail -1)
cpu=$(top -bn 1 | awk '{print $2}' | head -3 | tail -1)

if [ ! $connection ]
then
  network="󰖪 "
else
  network="󰖩  $connection"
fi

echo "$network | 󰻠 $cpu | 󰍛 $free/$used | 󰖀 ${volume%.*} | 󱐋 $battery | $time "

