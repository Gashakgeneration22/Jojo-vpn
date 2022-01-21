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

MYIP=$(wget -qO- icanhazip.com);
echo -e  "${red}Checking VPS${NC}"
sleep 2
IZIN=$( curl https://raw.githubusercontent.com/ADITYAH2/halucok/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
sleep 2 
else
clear
echo -e ""
echo -e "======================================="
echo -e "${red}===[ Permission Denied...!!! ]===${NC}";
echo -e "Contact WA https//wa.me/+6282339191527"
echo -e "For Registration IP VPS"
echo -e "======================================="
echo -e ""
exit 0
fi

# DELETE AKUN EXPIRED
               hariini=`date +%Y-%m-%d`
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
               
               userdel $username
               fi
               done
# DELETE

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

#MYIP=$(wget -qO- ipinfo.io/ip);
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Masukan Bug" Bug
read -p "Expired (hari): " masaaktif

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
sleep 1
echo "Akun Berhasil Dibuat!"
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
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
echo -e "SSLH / SSH    : 333"
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
echo -e " ${green}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe"
echo -e "================================="
echo -e ""
echo -e " Script Installer By : Geo•NTB"
echo -e "===============================" | lolcat
