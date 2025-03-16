apt install apt-transport-https curl
mkdir -p /etc/apt/keyrings    ### This might not exist in all distributions
curl -sSfL https://packages.openvpn.net/packages-repo.gpg >/etc/apt/keyrings/openvpn.asc
# echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian noble main" >>/etc/apt/sources.list.d/openvpn3.list
echo "deb [trusted=yes] https://packages.openvpn.net/openvpn3/debian noble main" >>/etc/apt/sources.list.d/openvpn3.list
apt update
apt install openvpn3


curl -sSfL https://packages.openvpn.net/packages-repo.gpg >/etc/apt/keyrings/openvpn.asc
# https://packages.openvpn.net/openvpn3/debian
