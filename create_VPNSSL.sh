#!/bin/bash
​
RELEASE=$(awk -F'=' '$1=="NAME" {print $2}' /etc/os-release)
​
QPACKRPM=`rpm -qa | grep "NetworkManager-openconnect-gnome\|NetworkManager-openconnect\|openconnect"|wc -l 2> /dev/null`
QPACKDPKG=`dpkg --list|grep "manager-openconnect\|network-manager-openconnect-gnome\|openconnect"|wc -l 2> /dev/null`
​
if ! [ "${QPACKRPM}" -eq "3" ] || [ "${QPACKDPKG}" -gt "3" ] ; then
	if [ "${RELEASE}" == "Fedora" ]; then
			sudo yum install -y NetworkManager-openconnect-gnome NetworkManager-openconnect openconnect 2> /dev/null
		else			
			sudo apt-get install -y network-manager-openconnect network-manager-openconnect-gnome openconnect 2> /dev/null
	fi
fi
​
DIRCERT=${HOME}/Documents/CA
NAMECERT=pacert.pem
USER=`whoami`
VPNNAME="VPN SSL" 
​
[ -d ${DIRCERT} ] || mkdir -p ${DIRCERT}
​
echo '-----BEGIN CERTIFICATE-----
MIIHEDCCBfigAwIBAgIRAOM7dkV73Nr7sm4qxGdKpTUwDQYJKoZIhvcNAQELBQAw
gcUxCzAJBgNVBAYTAkJSMRMwEQYDVQQIDApTw6NvIFBhdWxvMR4wHAYDVQQHDBVT
w6NvIEpvc8OpIGRvcyBDYW1wb3MxSzBJBgNVBAoMQlRydXN0U2lnbiBDZXJ0aWZp
Y2Fkb3JhIERpZy4gJiBTb2x1w6fDtWVzIFNlZ3VyYW7Dp2EgZGEgSW5mLiBMdGRh
LjE0MDIGA1UEAxMrVHJ1c3RTaWduIEJSIENlcnRpZmljYXRpb24gQXV0aG9yaXR5
IChEVikgMjAeFw0xOTA0MDIwMDAwMDBaFw0yMTA0MDEyMzU5NTlaMGAxITAfBgNV
BAsTGERvbWFpbiBDb250cm9sIFZhbGlkYXRlZDEeMBwGA1UECxMVRXNzZW50aWFs
U1NMIFdpbGRjYXJkMRswGQYDVQQDDBIqLmUtdW5pY3JlZC5jb20uYnIwggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDE3Zlg5zki24PdRIr31QOUNltWd7Nn
7tqJTZY2DweMunilRRM8aVcATxy8PQMxJhIZEBYIGBPIQOd337cfbzH0U4UQiuww
CDQtNX8W6G3HoQYSzbSd+/+V3lE55A4ahz0XC006FzPj1ZRUF2lNKwOcePgZ/zqc
Ud1Ex404Qb2hU07MDSe7W+ZaQATsEaLhMjFDKUhaRY7/qZXExrknSGfrHDaOV39J
8ouUchINrgE7xGTMEZZuBEpwukCYosewGRZ7cX+Ad3gHDsL9r1SrtsLVB0YBtlha
wW+guofZ4QM98wVvBTqNVR77GFmThqHGiqypqNPJ7PCcTFbWz6U2jwTLAgMBAAGj
ggNdMIIDWTAfBgNVHSMEGDAWgBSBkbYnLPKnb4z/zxoadiVLfnQVDjAdBgNVHQ4E
FgQU7/tN60yorndYLgZOEzzST6tlUlUwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB
/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMEsGA1UdIAREMEIw
NgYLKwYBBAGyMQECAiYwJzAlBggrBgEFBQcCARYZaHR0cHM6Ly9jcHMudXNlcnRy
dXN0LmNvbTAIBgZngQwBAgEwUgYDVR0fBEswSTBHoEWgQ4ZBaHR0cDovL2NybC51
c2VydHJ1c3QuY29tL1RydXN0U2lnbkJSQ2VydGlmaWNhdGlvbkF1dGhvcml0eURW
Mi5jcmwwgYQGCCsGAQUFBwEBBHgwdjBNBggrBgEFBQcwAoZBaHR0cDovL2NydC51
c2VydHJ1c3QuY29tL1RydXN0U2lnbkJSQ2VydGlmaWNhdGlvbkF1dGhvcml0eURW
Mi5jcnQwJQYIKwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wLwYD
VR0RBCgwJoISKi5lLXVuaWNyZWQuY29tLmJyghBlLXVuaWNyZWQuY29tLmJyMIIB
fwYKKwYBBAHWeQIEAgSCAW8EggFrAWkAdgC72d+8H4pxtZOUI5eqkntHOFeVCqtS
6BqQlmQ2jh7RhQAAAWnfbZ/OAAAEAwBHMEUCIQCn+Vszyh+ig2PHs36Q+JLXuGAS
Ejo/wAtE7ZqVr4N0+wIgGplZXL3g8GCVwvH7OezwqXNpzwiFOben3wP71AYBXrAA
dwBElGUusO7Or8RAB9io/ijA2uaCvtjLMbU/0zOWtbaBqAAAAWnfbaCLAAAEAwBI
MEYCIQC+Cc3pGJjMFsdXKrGgjtbZ3nX9TmXhzLLZcVZe2OrfTQIhAKwA235sEUtX
EdKlX0FRd2C4Xr7GX3R86zWxEOP0l/OvAHYAXNxDkv7mq0VEsV6a1FbmEDf71fpH
3KFzlLJe5vbHDsoAAAFp322f9wAABAMARzBFAiEA4h9qqCu4oQw+5XoleC5RF+lw
9cC9/FUFd/sqSuwA79MCIFl/6bGQjUHYhJc0XiTzrsmds1dh1pnMRt31QH9HHNpn
MA0GCSqGSIb3DQEBCwUAA4IBAQAzAY/hd3fz2Lr6ufZ31cNF/bYOGRq3NYKPv4MG
ouyeTwznt5rySd3eY4QD/NM3TxHc42GEcSR1xCP1TRsZeoWqrDjD2pyzYn86dSMC
Gg+fdnJ54tZ/C/7NIHkNh2rOgnr1R7jmTJ3sFCDuIJ3KxYFxdmGNiFFZtfYixsZE
Nb/52aBazna4WU85yDEmmWjilAHnb71P7w64THaFg5wESBytpyAlSkOXM/1Vfz8m
zT+EcuizFC+uanNudJ25czvdcYy61HxcnIg79dXzLJBZ+6UZ4Lw/aMAgHvCZB65y
yE5E42FuFOfw79BmNZcjDuSdbycTA65t/tJXZHfVxyhBeqF2
-----END CERTIFICATE-----' > ${DIRCERT}/${NAMECERT}
​
NMCLI=`nmcli con | grep "${VPNNAME}"`
RET=$?
NMCLI=`echo ${NMCLI} | awk '{print $4}'`
​
if [ $RET -ne 0 ]; then
		sudo nmcli connection add con-name "${VPNNAME}" ifname "" connection.type vpn vpn-type openconnect connection.autoconnect no connection.permissions user:${USER} ipv4.method auto ipv6.method auto vpn.secrets "lasthost=vpn.e-unicred.com.br" vpn.data "authtype = password, autoconnect-flags = 0, cacert = ${DIRCERT}/${NAMECERT}, certsigs-flags = 0, cookie-flags = 2, enable_csd_trojan = no, gateway = vpn.e-unicred.com.br, gateway-flags = 2, gwcert-flags = 2, lasthost-flags = 0, pem_passphrase_fsid = no, prevent_invalid_cert = no, protocol = gp, stoken_source = disabled, xmlconfig-flags = 0"
	else
		echo -e "\"${VPNNAME}""\" já existe!\n - Deletar vpn ==> sudo nmcli con del ${NMCLI}"
​
fi
