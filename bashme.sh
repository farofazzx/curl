#!/data/data/com.termux/files/usr/bin/bash

echo "Bem vindo"
echo "Escolha uma opção:"
echo "{1} = IP Checker"
echo "{2} = User agent bypass"
echo "{3} = Discord lookup"
echo -n "Digite o número (1-3): "
read opcao

case $opcao in
    1)
        echo -n "Digite o IP (ou Enter para o seu IP): "
        read ip
        if [ -z "$ip" ]; then
            ip=$(curl -s https://ipwhois.io | jq -r '.ip')
        fi
        echo "Dados do IP $ip:"
        curl -s "https://ipwhois.io/json/$ip" | jq '.' [attached_file:1][web:2]
        ;;
    2)
        echo -n "User-Agent (opcional, Enter para pular): "
        read ua
        echo -n "URL: "
        read url
        if [ -n "$ua" ]; then
            curl -s -H "User-Agent: $ua" "$url" | jq '.' 2>/dev/null || curl -s -H "User-Agent: $ua" "$url"
        else
            curl -s "$url" | jq '.' 2>/dev/null || curl -s "$url"
        fi
        ;;
    3)
        echo -n "Digite o termo para OSINT (ex: username, email, IP): "
        read termo
        echo "Dados OSINT para '$termo':"
        curl -s "https://cord.cat/api/v1/lookup/$termo" | jq '.' 2>/dev/null || echo "Erro na API ou sem jq." [web:9]
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac
