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
cd QR_CODES  
    curl qrenco.de/$custom_url > $custom_url.txt
echo -e "\033[38;5;40m\033[0m"


echo -e "\\033[35mQr Code Has Been Saved in "QR_CODES" Folder.\\033[0m"
echo -e "\\033[35m\\033[0m"
echo -e "\\033[35mPress Enter To Exit.\\033[0m"
read 

else
    
    exit
fi
