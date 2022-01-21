#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Script By geo"
clear
IP=$(wget -qO- icanhazip.com);
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Usernew: " -e user
		CLIENT_EXISTS=$(grep -w $user /var/lib/premium-script/data-user-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "Password: " pass
read -p "Expired (days): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%d-%m-%Y"`
created=`date -d "0 days" +"%d-%m-%Y"`
cat >> /home/sstp/sstp_account <<EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/premium-script/data-user-sstp"
clear
cat <<EOF

================================
SSTP VPN

Server IP     : $IP
Username      : $user
Password      : $pass
Port          : $sstp
Cert          : http://$IP:81/server.crt
===============================
${green}Aktif Selama   : $masaaktif Hari
Dibuat Pada    : $tnggl
Berakhir Pada  : $expe${off}
===============================

echo -e "Script By @sampiiiiu"
===============================
EOF
