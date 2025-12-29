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
echo "$response" | grep -E '"(city|latitude|longitude|security.proxy|security.anonymous|security.tor|security.vpn)":"[^"]*"' | sed 's/.*"\([^"]*\)":"\([^"]*\)".*/\1: \2/'
