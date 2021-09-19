echo $SCREEN_IS_INVERTED

# this script rotates the screen 180 degrees while also inverting touchpad/mouse movements
# useful for showing your screen to someone sitting in front of you by opening the lid 180 degrees

# run with dot: . ./script
touchpad_id=14
prop="Coordinate Transformation Matrix"

if [ $SCREEN_IS_INVERTED == 1 ]
then
	export SCREEN_IS_INVERTED=0
	xrandr -o normal
	xinput set-prop $touchpad_id "$prop" 1.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 1.0
	echo "normal"
else	
	export SCREEN_IS_INVERTED=1
	xrandr -o inverted
	xinput set-prop $touchpad_id "$prop" -1.0 0.0 1.0 0.0 -1.0 1.0 0.0 0.0 1.0
	echo "inverted"
fi

echo $SCREEN_IS_INVERTED
