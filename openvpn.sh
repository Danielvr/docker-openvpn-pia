#set -o nounset                              # Treat unset variables as an error
# Edit file to use login.conf file
exec sed -ie 's/^.*\bauth-user-pass\b.*$/auth-user-pass login.conf/g' /etc/openvpn/$PIA_COUNTRY.ovpn;
echo $PIA_USERNAME$'\n'$PIA_PASSWORD > "/etc/openvpn/login.conf";
#exec openvpn /etc/openvpn/$PIA_COUNTRY.ovpn