echo ".___       .__        _____       ";
echo "|   |_____ |__| _____/ ____\\____  ";
echo "|   \\____ \\|  |/    \\   __\\/  _ \\ ";
echo "|   |  |_> >  |   |  \\  | (  <_> )";
echo "|___|   __/|__|___|  /__|  \\____/ ";
echo "    |__|           \\/             ";

echo "Provide ip"
read ip
response=$(curl -s https://ipwho.is/$ip)
echo "$response"
