clear

echo ".___       .__        _____       ";
echo "|   |_____ |__| _____/ ____\\____  ";
echo "|   \\____ \\|  |/    \\   __\\/  _ \\ ";
echo "|   |  |_> >  |   |  \\  | (  <_> )";
echo "|___|   __/|__|___|  /__|  \\____/ ";
echo "    |__|           \\/             ";

echo "Provide ip"
read ip
response=$(curl -s https://ipwho.is/$ip)

echo "=== Location ==="
echo "$response" | grep -o '"City":"[^"]*"' | sed 's/.*"City":"\([^"]*\)".*/City: \1/'
echo "$response" | grep -o '"Latitude":[^,}]*' | sed 's/.*"Latitude":\([^,]*\).*/Latitude: \1/'
echo "$response" | grep -o '"Longitude":[^,}]*' | sed 's/.*"Longitude":\([^,]*\).*/Longitude: \1/'

echo -e "\n=== Security ==="
echo "$response" | grep -E '"security\.(anonymous|tor|vpn|proxy)"' | sed 's/.*"security\.\([^"]*\)":"\([^"]*\)".*/\1: \2/'
