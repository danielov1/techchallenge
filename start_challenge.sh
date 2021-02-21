#!/bin/bash

checkLinesRemove () {
    checkLineRemove=$(grep -oh $1 ~/challenge/demo1/.tf/variables.tf)
if [[ $checkLineRemove == "$1" ]]
    then
        sed -i.bak "/$1/d" ~/challenge/demo1/.tf/variables.tf
        echo "old $1 was removed"
else
        echo "accessKey is not configured, configuring a new accessKey"
fi
}


createPubKey () {
    publicKeyCheck=$(cd ~/challenge/demo1/ && ls -l | grep -oh chlng.pub)

if [[ $publicKeyCheck == "$1.pub" ]]
    then
        rm $1 $1.pub
        cd ~/challenge/demo1 && ssh-keygen -f $1 -q -N ""
        publicKey=$(cat $1.pub)
else
        cd ~/challenge/demo1 && ssh-keygen -f $1 -q -N ""
        publicKey=$(cat $1.pub)
fi
}

checkQuotes () {
if [[ $2 == *'"'* ]]
    then
        echo -e " variable "$1" {default = $2}" >> ~/challenge/demo1/.tf/variables.tf
else
        withQuotes=\"${2}\"
        echo -e " variable "$1" {default = $withQuotes}" >> ~/challenge/demo1/.tf/variables.tf
fi
}

checkConfigured () {
checkIfCongigured=$(grep -oh $1 ~/challenge/demo1/.tf/variables.tf)
if [[ $checkIfCongigured == "$1" ]]
    then
        echo "$1 is configured"
else
        echo "$1 is not configured"
fi
}


checkLinesRemove accessKey
checkLinesRemove secretKey
checkLinesRemove sessionToken
checkLinesRemove publicKey
createPubKey chlng
checkQuotes accessKey "$AWS_ACCESS_KEY_ID"
checkQuotes secretKey "$AWS_SECRET_ACCESS_KEY"
checkQuotes sessionToken "$AWS_SESSION_TOKEN"
checkQuotes publicKey "$publicKey"
checkConfigured accessKey
checkConfigured secretKey
checkConfigured sessionToken
checkConfigured publicKey


#brew install terraform
#cd ~/challenge/demo1/.tf
#terraform init
#terraform apply -input=false -auto-approve