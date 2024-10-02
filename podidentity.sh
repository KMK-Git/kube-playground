export credentials=`curl -s http://169.254.170.23/v1/credentials -H "Authorization: $(cat /var/run/secrets/pods.eks.amazonaws.com/serviceaccount/eks-pod-identity-token)"`
export AWS_ACCESS_KEY_ID=`echo $credentials | jq -r '.AccessKeyId'`
export AWS_SECRET_ACCESS_KEY=`echo $credentials | jq -r '.SecretAccessKey'`
export AWS_SESSION_TOKEN=`echo $credentials | jq -r '.Token'`
aws sts get-caller-identity