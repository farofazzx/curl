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
echo "$response" | grep -o '"city":"[^"]*"' | sed 's/.*"city":"\([^"]*\)".*/\1/'
echo "$response" | grep -o '"latitude":"[^"]*"' | sed 's/.*"latitude":"\([^"]*\)".*/\1/'
echo "$response" | grep -o '"security.anonymous":"[^"]*"' | sed 's/.*"security.anonymous":"\([^"]*\)".*/\1/'
echo "$response" | grep -o '"security.proxy":"[^"]*"' | sed 's/.*"security.proxy":"\([^"]*\)".*/\1/'
