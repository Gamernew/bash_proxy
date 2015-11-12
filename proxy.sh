#!/bin/sh
echo "script installation et désintallation de la configuration du proxy à utiliser en (Root) crée par gamernew"

if [ "su" ]; then
cd /etc/apt/
res=$(cat apt.conf)
if [ "$res" = '# Acquire::http::Proxy "http://192.168.1.34:3142";' ];then
  echo -n "Voulez-vous mettre le proxy (Y/N) : "
  read ouinon
  if [ "$ouinon" = "y" ] || [ "$ouinon" = "Y" ]; then
    echo 'Acquire::http::Proxy "http://192.168.1.34:3142";' > apt.conf
    echo "Le proxy à bien était mis à jour"
  else
    echo "Vous n'avez pas fait de modification"
  fi
else
  echo -n "Vous avez enlever le proxy (Y/N) : "
  read ouinon
  if [ "$ouinon" = "y" ] || [ "$ouinon" = "Y" ]; then
  echo '# Acquire::http::Proxy "http://192.168.1.34:3142";' > apt.conf
  echo "Le proxy à bien était mis à jour"
  else
    echo "Vous n'avez pas fait de modification"
  fi
fi
fi
