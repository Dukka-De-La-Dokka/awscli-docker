#!/bin/bash

# Please execute shellscript file under source command
# If you use bash command, environment variables can not be set...

# Getting variables from external txt file
. ./vars-switchrole.txt

# getting credentials - key id, access key, and token
AWS_STS_CREDENTIALS=$(aws sts assume-role \
--role-arn arn:aws:iam::"${TARGET_ACCTID}":role/"${ROLE_NAME}" \
--role-session-name "${SESSION_NAME}")

# extract the each credential using jq command
AWS_ACCESS_KEY_ID=$(echo "${AWS_STS_CREDENTIALS}" | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo "${AWS_STS_CREDENTIALS}" | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo "${AWS_STS_CREDENTIALS}" | jq -r '.Credentials.SessionToken')

# setting issued credentials into environment variables
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
