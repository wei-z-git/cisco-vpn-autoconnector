#!/bin/bash -ex

vpn-controller(){
    echo $vpn_pac
    #1.connect 2.disconnected
    export vpn_status=`/opt/cisco/anyconnect/bin/vpn status |grep Disconnected`
    export vpn_pac=$4
    export if_adm=$5
    if [ "$if_adm" = true ]; then
        networksetup -setautoproxyurl "Wi-Fi" "$vpn_pac"
        networksetup -setautoproxyurl "AX88179A" "$vpn_pac"
    fi
    if [ -n "$vpn_status" ];then
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
