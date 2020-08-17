if [[ $(xdotool get_desktop) = 0 ]]
then
	xdotool set_desktop 1
else
	xdotool set_desktop 0
fi

