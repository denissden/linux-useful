touchpad_id=$( xinput list | grep Touchpad | grep -o -E 'id=[0-9]+' | grep -o -E '[0-9]+')
prop_id=$(xinput list-props 14 | grep -o -E 'Disable While Typing Enabled \([0-9]+\)' | grep -o -E '[0-9]+')

xinput set-prop $touchpad_id $prop_id 0

