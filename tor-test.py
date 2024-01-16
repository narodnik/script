# pip install pysocks
import socks
import socket
socks.set_default_proxy(socks.SOCKS5, "127.0.0.1", 9050)
socket.socket = socks.socksocket
import requests
response = requests.get("https://myip.wtf/text")
print(response.content)

