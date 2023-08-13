apt update
read -p "Enter the IP address of SERVER1: " VPS1_IP
VPS_IP=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}' | cut -d ':' -f2)
sudo sysctl net.ipv4.ip_forward=1
sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j DNAT --to-destination $VPS_IP
sudo iptables -t nat -A PREROUTING -j DNAT --to-destination $VPS1_IP
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
echo "$VPS_IP"



#bash <(curl -Ls https://raw.githubusercontent.com/Real-kia/portforward/master/tunnel.sh)
