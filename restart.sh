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
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "Name : Restart Service" | lolcat
echo -e ""
echo -e "    [1] Restart All Services" | lolcat
echo -e "    [2] Restart OpenSSH" | lolcat
echo -e "    [3] Restart Dropbear" | lolcat
echo -e "    [4] Restart Stunnel4" | lolcat
echo -e "    [5] Restart OpenVPN" | lolcat
echo -e "    [6] Restart Squid" | lolcat
echo -e "    [7] Restart Nginx" | lolcat
echo -e "    [8] Restart Shadowsocks TLS" | lolcat
echo -e "    [9] Restart Shadowsocks HTTP" | lolcat
echo -e "    [10] Restart Badvpn" | lolcat
echo -e "    [x] Exit"
echo -e ""
read -p "    Select From Options [1-10 or x] :  " Restart
echo -e ""
echo -e "======================================" | lolcat
sleep 1
clear
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                systemctl restart shadowsocks-libev-server@tls
                systemctl restart shadowsocks-libev-server@http
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "          Service/s Restarted         "  | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "         SSH Service Restarted        " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "       Dropbear Service Restarted     " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "        Stunnel4 Service Restarted    " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "       OpenVPN Service Restarted      " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "        Squid3 Service Restarted      " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "         Nginx Service Restarted      " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                8)
                clear
                systemctl restart shadowsocks-libev-server@tls
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "         Shadowsocks tls Service Restarted " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                9)
                clear
                systemctl restart shadowsocks-libev-server@http
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "         Shadowsocks http Service Restarted " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                10)
                clear
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "    Badvpn  Badvpn Service Restarted  " | lolcat
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
