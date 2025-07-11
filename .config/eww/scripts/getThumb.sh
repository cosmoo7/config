while true; do
    if [ ! -z $(playerctl metadata mpris:artUrl 2>/dev/null) ]; then
        echo "$(playerctl metadata mpris:artUrl | cut -c 8-)" > $XDG_CONFIG_HOME/eww/thumb
    else
        echo "$XDG_CONFIG_HOME/eww/img/blankCover.png" > $XDG_CONFIG_HOME/eww/thumb
    fi
done
