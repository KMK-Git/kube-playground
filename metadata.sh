export TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
export credentials=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance`
export AWS_ACCESS_KEY_ID=`echo $credentials | jq -r '.AccessKeyId'`
export AWS_SECRET_ACCESS_KEY=`echo $credentials | jq -r '.SecretAccessKey'`
export AWS_SESSION_TOKEN=`echo $credentials | jq -r '.Token'`
aws sts get-caller-identity
