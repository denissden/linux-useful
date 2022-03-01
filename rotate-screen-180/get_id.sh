


devs=$(xinput list | sed -n 's/^.*[Tt]ouchpad.*id=\([0-9]*\).*/\1/p')
echo $devs


