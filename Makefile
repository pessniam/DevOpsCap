lint:
	tidy -q -e ./blueapp/*.html
	tidy -q -e ./greenapp/*.html
	echo "Linting the HTML"
	
docker-build:
	docker build -f blueapp/Dockerfile -t pessniam/blueapp .
	docker build -f greenapp/Dockerfile -t pessniam/greenapp .

docker-push:
	docker push pessniam/blueapp
	docker push pessniam/greenapp

kubectl-config:
	aws eks --region us-west-2 update-kubeconfig --name EksCluster-gFPNOsJssujO
	kubectl config use-context arn:aws:eks:us-west-2:568283627415:cluster/EksCluster-gFPNOsJssujO
	kubectl apply -f ./INFRA/K8s/aws-auth-config.yaml

deploy-blue:
	kubectl apply -f ./INFRA/K8s/blue-controller.yaml
	kubectl apply -f ./INFRA/K8s/blue-service.yaml
	kubectl get pods
	kubectl get service

	
deploy-green:
	kubectl apply -f ./INFRA/K8s/green-controller.yaml
	kubectl apply -f ./INFRA/K8s/green-service.yaml
	kubectl get pods
	kubectl get service
	
blueToGreen:
	kubectl apply -f ./INFRA/K8s/blue-to-green-service.yaml

	
all: lint docker-build docker-push kubectl-config deploy-blue deploy-green blueToGreen