#!/bin/bash
grey='\x1b[90m'
red='\x1b[91m'
green='\x1b[92m'
yellow='\x1b[93m'
blue='\x1b[94m'
purple='\x1b[95m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
flag='\x1b[47;41m'

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

MYIP=$(wget -qO- ipinfo.io/ip);
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
IP=$(wget -qO- ifconfig.co);
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
read -p "Masukan Bug" Bug
Login=Trial_`</dev/urandom tr -dc X-Z0-9 | head -c2`
hari="1"
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
Pass=`</dev/urandom tr -dc 0-9 | head -c2`
useradd -e `date -d "1 days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Name : SSH , WebSocket, Openvpn"
echo -e "===============================" | lolcat
echo -e "Username      : $Login "
echo -e "Password      : $Pass"
echo -e "===============================" | lolcat
echo -e "ISP           : $ISP"
echo -e "Host          : $IP"
echo -e "Domain        : $domain"
echo -e "OpenSSH       : 22"
echo -e "Dropbear      : 109, 143"
echo -e "SSL/TLS       :$ssl"
echo -e "WS SSL        : 443"
echo -e "WS Non SSL    : 2095"
echo -e "WS Ovpn       : 2082"
echo -e "Port Squid    :$sqd"
echo -e "Badvpn Udpgw  : 7100-7300"
echo -e "===============================" | lolcat
echo -e "OpenVPN TCP   : $ovpn http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN UDP   : $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN SSL   : 442  http://$IP:81/client-tcp-ssl.ovpn"
echo -e "===============================" | lolcat
echo -e "Payload WebSocket"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$Bug:2095@$Login:$Pass"
echo -e "================================="
echo -e " ${green}Aktif Selama   : $masaaktif hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe"
echo -e "================================="
echo -e ""
echo -e " Script Installer By : Geo Gabut•NTB"
echo -e ""
echo -e "===============================" | lolcat
