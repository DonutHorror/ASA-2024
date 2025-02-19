;
; BIND data file for client1.com
;
$ORIGIN client1.com.
$TTL    604800

@       IN  SOA ns.client1.com. admin.client1.com. (
                2024060101      ; Serial (formato AAAAMMDDXX)
                3600            ; Refresh
                1800            ; Retry
                1209600         ; Expire
                86400 )         ; Negative Cache TTL

; Nameservers
@       IN  NS  ns.client1.com.

; Endereços IP
@       IN  A   192.168.1.188       ; IP do servidor DNS (provedor)
ns      IN  A   192.168.1.188       ; Nameserver
mail    IN  A   192.168.1.188       ; Servidor de e-mail
www     IN  A   192.168.1.188       ; Servidor web
web     IN  A   192.168.1.188       ; Servidores web
proxy   IN  CNAME www           ; Proxy reverso (aponta para www)