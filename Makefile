deploy-blue:
	aws eks --region us-west-2 update-kubeconfig --name EksCluster-c9qMPZrayphT
	kubectl config use-context arn:aws:eks:us-west-2:568283627415:cluster/EksCluster-c9qMPZrayphT
	kubectl apply -f ./INFRA/K8s/blue-controller.yaml
	

all: deploy-blue