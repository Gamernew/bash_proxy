#!/bin/sh -x
echo "script installation et désintallation de la configuration du proxy à utiliser en (Root) crée par gamernew"

# check if user has root rules
if [ `/usr/bin/id -u` != 0 ]; then
  echo "You require Root Access to run this script";
  exit 0;
fi

# check if an proxy is used
PROXY_USED=`apt-config dump | grep -c Acquire::http::Proxy`
# store config file for proxy
PROXY_FILE="/etc/apt/apt.conf"
# define proxy url and port
PROXY_LINE='Acquire::http::Proxy "http://192.168.1.34:3142";'

# ask question to user
echo -n "Voulez-vous mettre le proxy (Y/N) : "
read ouinon


case "$ouinon" in
  y|Y|Yes|YES)
    echo $PROXY_LINE > $PROXY_FILE
    break
    ;;
  n|N)
    echo '' > $PROXY_FILE
    break
    ;;
  s|status)
    if [ "${PROXY_USED}" = "1" ]; then
      echo 'You use an proxy'
    fi
    break
    ;;
  *)
    echo "Please enter \n"
    echo " y OR yes \n"
    echo "n or no \n"
    echo "s or status \n"
    ;;
esac
