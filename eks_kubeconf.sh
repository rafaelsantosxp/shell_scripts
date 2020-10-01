https://aws.amazon.com/premiumsupport/knowledge-center/eks-api-server-unauthorized-error/

aws eks --region us-east-1 update-kubeconfig --name test

aws sts get-caller-identity
kubectl edit configmap aws-auth -n kube-system

