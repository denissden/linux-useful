# this script rotates the screen 180 degrees while also inverting touchpad/mouse movements
# useful for showing your screen to someone sitting in front of you by opening the lid 180 degrees

# run with dot: . ./script
touchpad_id=$(xinput list | sed -n 's/^.*[Tt]ouchpad.*id=\([0-9]*\).*/\1/p')
prop="Coordinate Transformation Matrix"



#if cache directory doesn't exist, create it
cache="/tmp/rotate-screen-180" 
if [ ! -f $cache ]
then
	mkdir -p $cache
fi


if [ -f "${cache}/lock" ]
then
	export SCREEN_IS_INVERTED=0
	xrandr -o normal
	xinput set-prop $touchpad_id "$prop" 1.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 1.0
	rm "${cache}/lock"
else	
	export SCREEN_IS_INVERTED=1
	xrandr -o inverted
	xinput set-prop $touchpad_id "$prop" -1.0 0.0 1.0 0.0 -1.0 1.0 0.0 0.0 1.0
	touch "${cache}/lock"
fi

