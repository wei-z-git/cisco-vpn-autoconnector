#!/bin/bash -ex

vpn-controller(){
    #1.connect 2.disconnected
    export vpn_status=`/opt/cisco/anyconnect/bin/vpn status |grep Disconnected`
    if [ -n "$vpn_status" ];then
        networksetup -setautoproxyurl "Wi-Fi" "http://proxycn-sh.cn.bmwgroup.net/proxy.pac"
        source ~/cisco-vpn-autoconnector/get-key-example.sh
        export vpn_server=$1
        export qnum=$2
        export pin=$3
        expect ~/cisco-vpn-autoconnector/connector
    else
        /opt/cisco/anyconnect/bin/vpn disconnect
    fi

}

vpn-controller "$@"