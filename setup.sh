#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo -e  "${RED}MENGECEK VPS${NC}"
sleep 2
IZIN=$( curl https://raw.githubusercontent.com/ADITYAH2/halucok/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}PERMINTAAN DITERIMAH...${NC}"
sleep 2 
else
clear
echo -e ""
echo -e "======================================="
echo -e ""
echo -e "${RED}Permission Denied...!!! ${NC}"
echo -e "IP VPS ANDA BELUM TERDAFTAR"
echo -e "Contact WA https//wa.me/+6282339191527"
echo -e "For Registration IP VPS"
echo -e ""
echo -e "======================================="
echo -e ""
rm setup.sh
exit 0
fi
echo -e  "${RED}Checking VPS Domain${NC}"
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed!!"
exit 0
fi
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
wget http://raw.githubusercontent.com/ADITYAH2/halucok/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install L2TP
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#install edu
#wget https://halucok.me/websocket.sh && chmod +x websocket.sh && ./websocket.sh
#wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/edu/jamal.sh && chmod +x jamal.sh && ./jamal.sh
#wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/edu/edu.sh && chmod +x edu.sh && screen -S edu ./edu.sh

# Encrypt
cd
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/enc.sh && chmod +x enc.sh && ./enc.sh

# Antiabuse
cd
wget https://raw.githubusercontent.com/ADITYAH2/halucok/main/menu-all/antiabuse.sh && chmod +x antiabuse.sh && ./antiabuse.sh

rm -f /root/enc.sh
rm -f /root/antiabuse.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/geo.sh
rm -f /root/websocket.sh
rm -f /root/edu.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://geoganteng.tech

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/ADITYAH2/halucok/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "============-AUTOSCRIPT PREMIUM-=============" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "---------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : GEO GABUT"  | tee -a log-install.txt
echo "   - Telegram                : T.me/sampiiiiu"  | tee -a log-install.txt
echo "   - Instagram               : @sampiiiiu"  | tee -a log-install.txt
echo "   - Whatsapp                : 085333790161"  | tee -a log-install.txt
echo "   - Facebook                : https://www.facebook.com/MuhammadAmin" | tee -a log-install.txt
echo "------------------Script Created By geo-----------------" | tee -a log-install.txt
echo ""
echo " Reboot 10 Sec"
sleep 10
rm -f setup.sh
reboot
