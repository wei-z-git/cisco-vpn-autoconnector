#!/bin/bash -ex

vpn-controller(){
    echo $vpn_pac
    #1.connect 2.disconnected
    export vpn_status=`/opt/cisco/anyconnect/bin/vpn status |grep Disconnected`
    if [ -n "$vpn_status" ];then
        export vpn_pac=$4
        networksetup -setautoproxyurl "Wi-Fi" "$vpn_pac"
        networksetup -setautoproxyurl "AX88179A" "$vpn_pac"
        source ~/cisco-vpn-autoconnector/get-key.sh
        export vpn_server=$1
        export qnum=$2
        export pin=$3
        expect ~/cisco-vpn-autoconnector/connector
        echo $meta
    else
        /opt/cisco/anyconnect/bin/vpn disconnect
    fi

}

vpn-controller "$@"
