#!/bin/sh
current_ip=`curl -silent -L http://checkip.amazonaws.com|tail -n 1`
old_ip=`cat v4.ip`

# cambiare con i propri indirizzi email
to="crasholo@github.com"
headers="From: crasholo <crasholo@github.com>\r\n"
subject="[CONNESSIONE] - Cambio IP pubblico"

if [ "$old_ip" != "$current_ip" ]; then
	# aggiorno file v4.ip e mando mail
	`touch v4.ip`
	`echo $current_ip > v4.ip`
	body=`printf "Ciao!\r\n\r\nL\'IP della connessione e\' cambiato!\r\n\r\nVecchio IP: $old_ip\r\n Nuovo IP: $current_ip\r\n\r\n\r\n"`
	`/usr/bin/php -r "mail('$to', '$subject', '$body', '$headers');"`
fi
