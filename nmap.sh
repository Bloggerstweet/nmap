echo "Enter Your Ip Address"
read ip


echo "Select an option:"
echo "1. Option 1 IP SCAN"
echo "2. Option 2 PORT SCAN"
echo "3. Option 3 DATA INTO XML"
echo "4. Option 4 XML TO HTML"

read choice

case $choice in
    1)
        echo "*****You chose IP Scan*****"
        echo "==========================="
        echo "Normal Scan"
        echo $ip
        sudo nmap $ip -sn
        echo "###########################"
        echo "ARPING Scan"
        echo "==========================="
        sudo arping $ip -c 3
        echo "###########################"
        echo "HPING3 Scan"
        echo "==========================="
        sudo hping3 $ip -icmp -c 3
        echo "###########################"
        echo "FPING3 Scan"
        echo "==========================="
        sudo fping3 $ip -c 6
        echo "###########################"
        
        ;;
    2)
        echo "*****You chose PORT Scan*****"
        echo "==========================="
        echo "Normal Scan"
        echo $ip
        sudo nmap $ip
        echo "###########################"
        echo "Detailed Scan"
        sudo nmap -vvv $ip
        echo "###########################"
        echo "HPING3 Scan"
        sudo hping3 $ip -scan 80 -S
        echo "###########################"
        echo "HPING3 Scan"
        sudo hping3 $ip -scan 10-500 -S
        echo "###########################"
        echo "Masscan"
        sudo masscan $ip -p 80
        echo "###########################"
        ;;
        
    3)
        echo "*****You chose Scanned data into XML*****"
        echo "converted data into xml"
        echo $ip
        sudo nmap -vv -A -T4 $ip -oX isha.xml
        echo "###########################"
       
        ;;
    4)
        echo "*****You chose XML to HTML*****"
        echo "converted xml to HTML"
        echo $ip
        sudo xsltproc isha.xml -o isha.html
        echo "###########################"
       
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        ;;
esac
