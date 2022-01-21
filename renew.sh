#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/Sangarya/VIP/main/install/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
echo "Name : Renew SSH & Openvpn Account"
echo "==================================" | lolcat
read -p "Username       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend     :  " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e "Name : Renew SSH & Openvpn Account"
echo -e "========================================" | lolcat
echo -e ""
echo -e "    Username        :  $User"
echo -e "    Days Added      :  $Days Days"
echo -e "    Expires on      :  $Expiration_Display"
echo -e ""
echo -e "========================================" | lolcat
else
clear
echo -e "Name : Renew SSH & Openvpn Account"
echo -e "======================================" | lolcat 
echo -e ""
echo -e "        Username Doesnt Exist        "
echo -e ""
echo -e "======================================" | lolcat
fi
