#!/bin/bash

## Check if lines are exist and remove them
checkLinesRemove () {
    checkLineRemove=$(grep -oh $1 ~/techchallenge/demo/.tf/variables.tf)
if [[ $checkLineRemove == "$1" ]]
    then
        sed -i.bak "/$1/d" ~/techchallenge/demo/.tf/variables.tf
        echo "old $1 var was removed, configuring a new $1 var..."
else
        echo "$1 var is not configured, configuring a new $1 var..."
fi
}

## Create a new Private & Public key
createPubKey () {
    publicKeyCheck=$(ls -l ~/techchallenge/demo/ |grep -oh chlng.pub)

if [[ $publicKeyCheck == "$1.pub" ]]
    then
        rm ~/techchallenge/demo/"$1" ~/techchallenge/demo/"$1.pub"
        echo "Public & Private keys removed, generating new keys..."
        cd ~/techchallenge/demo && ssh-keygen -f $1 -q -N ""
        publicKey=$(cat $1.pub)
else
        echo "Generating new keys..."
        cd ~/techchallenge/demo && ssh-keygen -f $1 -q -N ""
        echo "Private key name is 'chlng'"
        echo "Public key name is 'chlng.pub'"
        publicKey=$(cat $1.pub)
fi
}

## Check if Quotes are exist, If not add Quotes
checkQuotes () {
if [[ $2 == *'"'* ]]
    then
        echo -e " variable "$1" {default = $2}" >> ~/techchallenge/demo/.tf/variables.tf
else
        withQuotes=\"${2}\"
        echo -e " variable "$1" {default = $withQuotes}" >> ~/techchallenge/demo/.tf/variables.tf
fi
}

## Check config status
checkConfigured () {
checkIfCongigured=$(grep -oh $1 ~/techchallenge/demo/.tf/variables.tf)
if [[ $checkIfCongigured == "$1" ]]
    then
        echo "$1 is configured"
else
        echo "$1 is not configured"
fi
}

## Execute functions in order
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

## Install Terraform
brew install terraform
cd ~/techchallenge/demo/.tf
terraform init
terraform apply -input=true -auto-approve
