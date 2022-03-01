touchpad_id=$( xinput list | grep Touchpad | grep -o -E 'id=[0-9]+' | grep -o -E '[0-9]+')
prop_id=$(xinput list-props 14 | grep -o -E 'Accel Profile Enabled \([0-9]+\)' | grep -o -E '[0-9]+')

echo $1
if [ $1 -eq 1 ]
then
	xinput set-prop $touchpad_id $prop_id 1 0
else
	xinput set-prop $touchpad_id $prop_id 0 1
fi

