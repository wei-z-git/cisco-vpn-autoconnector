#!/bin/bash -ex

vpn-controller(){
    #1.connect 2.disconnected
    export vpn_status=`/opt/cisco/anyconnect/bin/vpn status |grep Disconnected`
    if [ -n "$vpn_status" ];then
        source ./get-key-example.sh
        export vpn_server=$1
        export qnum=$2
        export pin=$3
        expect ./connector
    else
        /opt/cisco/anyconnect/bin/vpn disconnect
    fi

}

vpn-controller "$@"