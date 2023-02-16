#!/usr/bin/expect -f
# source ./get_key

# 设置变量
set timeout 30
set pin "2022"
# set password $env(key)
set password "309017"

set qnum "qxxxxxx"

spawn /opt/cisco/anyconnect/bin/vpn connect 122.200.123.230
expect "YubiKey"
send "1\r"
expect "Username"
send "$qnum\r"
expect "Password"
send "$password\r"
expect "Answer"
send "$pin\r"

interact


