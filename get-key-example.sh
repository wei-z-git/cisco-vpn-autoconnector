export meta=`curl http://[ip]/v2/GetPushKey/gitee.com/amadeus666/keystore/secrets/[secret]`
echo $meta
export key=`echo $meta| jq -r .code`