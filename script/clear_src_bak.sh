
echo "the following files will be cleared:"
find /etc/apt/* -maxdepth 0 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}'
find /etc/apt/sources.list.d/* -maxdepth 0 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}'
read -p "confirm deleting the above files? [y/n]" confirm
if [ "$confirm" == "y" ] || [ "$confirm" == "yes" ]; then
    find /etc/apt/* -maxdepth 0 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}' | xargs sudo rm
    find /etc/apt/sources.list.d/* -maxdepth 0 -name "*.list.bak.*" | grep -E '20[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2}' | xargs sudo rm
    echo done.
fi
