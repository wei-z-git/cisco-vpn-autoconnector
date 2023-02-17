# Dependance
- expect,jq
```
brew install expect
brew install jq
```
# How to use
## 1. Store your yubikeys somewhere
I recommend store them in gitee.com
Refer this repo for more information: https://gitee.com/amadeus666/mobile_push_key
## 2. Get your keys
Examples in get-key-example.sh, getting keys from gitee
## 3. Run command
./vpn-controller.sh [vpn_server] [qnumber] [pin]

## 4.(optional) Alias your Command
cp -rf ../cisco-vpn-autoconnector ~/
alias cvpn='~/cisco-vpn-autoconnector/vpn-controller.sh [vpn_server] [qnumber] [pin]'
