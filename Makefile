deploy-blue:
	aws eks --region us-west-2 update-kubeconfig --name EksCluster-hVyio5Aa89V8
	kubectl config use-context arn:aws:eks:us-west-2:568283627415:cluster/EksCluster-hVyio5Aa89V8
	kubectl apply -f ./INFRA/K8s/blue-controller.yaml