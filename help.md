## Setting autoconnection to wifi
'''bash
nmcli device wifi connect {SSID} password {password}
nmcli connection modify {SSID} set connection.autoconnect yes
'''
## Getting connection status
'''bash
nmcli connection edit {SSID}
'''
