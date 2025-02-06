;
; BIND data file for areia.branca.com zone
;
$ORIGIN areia.branca.com.

$TTL	604800
@	IN	SOA	ns.areia.branca.com. root.areia.branca.com. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@		IN	NS		ns.areia.branca.com.
@		IN	MX  10  mail.areia.branca.com.
@		IN	MX  10  webmail.areia.branca.com.
@		IN  A		192.168.1.188

ns		IN  A  	 	192.168.1.188
mail	IN	A		192.168.1.188
webmail	IN	A		192.168.1.188
www		IN	A		192.168.1.188
proxy	IN	CNAME	www

