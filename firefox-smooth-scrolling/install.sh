# install user.js file into firefox profile directory

firefox_path=~/.mozilla/firefox/*.default-release
profiles=( $firefox_path )

n_profiles=${#profiles[@]} 

# TODO: add profile selection
if [ $n_profiles -gt 1 ]
then
	echo "There are multiple profiles. Please copy test.js into the right one."
	echo "To find out your profile go to 'about:support' page and click 'Open Directory' button."
fi

profile=${profiles[0]}

if [ -e "${profile}/user.js" ]
then
	echo "Do you want to overwrite user.js file at $profile? You may lose some of your settings."
	select yn in "Yes" "No"; do
   	case $yn in
		Yes ) break;;
        	No ) echo "Exiting"; exit;;
    	esac
	done
fi

cp user.js $profile
echo "Copied user.js to $profile"
