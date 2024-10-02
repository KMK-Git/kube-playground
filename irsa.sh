export credentials=`aws sts assume-role-with-web-identity --role-arn $AWS_ROLE_ARN --web-identity-token "$(cat $AWS_WEB_IDENTITY_TOKEN_FILE)" --role-session-name test`
export AWS_ACCESS_KEY_ID=`echo $credentials | jq -r '.Credentials.AccessKeyId'`
export AWS_SECRET_ACCESS_KEY=`echo $credentials | jq -r '.Credentials.SecretAccessKey'`
export AWS_SESSION_TOKEN=`echo $credentials | jq -r '.Credentials.SessionToken'`
aws sts get-caller-identity