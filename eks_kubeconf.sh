https://aws.amazon.com/premiumsupport/knowledge-center/eks-api-server-unauthorized-error/

aws eks --region us-east-1 update-kubeconfig --name test --role-arn arn:aws:iam::0000000000:role/AdminTest

aws sts get-caller-identity
kubectl edit configmap aws-auth -n kube-system

