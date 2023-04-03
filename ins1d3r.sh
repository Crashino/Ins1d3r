#!/bin/bash
clear
echo -e "\033[38;5;28m██╗███╗   ██╗███████╗ ██╗██████╗ ██████╗ ██████╗ \033[0m"
echo -e "\033[38;5;40m██║████╗  ██║██╔════╝███║██╔══██╗╚════██╗██╔══██╗\033[0m"
echo -e "\033[38;5;46m██║██╔██╗ ██║███████╗╚██║██║  ██║ █████╔╝██████╔╝\033[0m"
echo -e "\033[38;5;47m██║██║╚██╗██║╚════██║ ██║██║  ██║ ╚═══██╗██╔══██╗ 7.9\033[0m"
echo -e "\033[38;5;49m██║██║ ╚████║███████║ ██║██████╔╝██████╔╝██║  ██║\033[0m"
echo -e "\033[38;5;50m╚═╝╚═╝  ╚═══╝╚══════╝ ╚═╝╚═════╝ ╚═════╝ ╚═╝  ╚═╝\033[0m"
echo -e "\033[38;5;47m\033[0m" 

echo -e "\033[38;5;40mEnter Phishing Website:\033[0m"
read long_url



short_url=$(curl -s https://is.gd/create.php\?format\=simple\&url\=$long_url)

echo -e "\033[38;5;40mEnter Custom Domain:\033[0m"
read custom_domain


short_url=${short_url/https:\/\//}


custom_url="$custom_domain@$short_url"


echo -e "\033[38;5;40mMasked Phishing Link Generated: $custom_url\033[0m"

echo -e "\033[38;5;47mShortened Url(is.gd): https://$short_url\033[0m"

echo -e "\033[38;5;47m\033[0m" 
read -p "Do you want to make a QR Code Of The Masked Phishing Url? (Y/n) " response


if [[ $response == "Y" ]]; then
  echo -e "\033[38;5;47m\033[0m"  
    curl qrenco.de/$custom_url
echo -e "\033[38;5;47m\033[0m"

read -p "Do You Want To Save Your QR Code As A Txt File? (Y/n) " rep

if [[ $rep == "Y" ]]; then
echo -e "\033[38;5;47m\033[0m"
read -p "Enter Txt File Name: " nm
 curl qrenco.de/$custom_url >> $nm.txt
echo -e "\033[38;5;47m\033[0m"
echo -e "\033[38;5;47m Your File Has Been Saved As /home/kali/$nm.txt Press Enter To exit\033[0m"
read
exit
else
exit
fi
else
    
    exit
fi
