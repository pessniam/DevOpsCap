lint:
	tidy -q -e ./blueapp/*.html
	tidy -q -e ./greenapp/*.html
	echo "Linting the HTML"
	
docker-build:
	docker build -f blueapp/Dockerfile -t pessniam/blueapp .
	docker build -f greenapp/Dockerfile -t pessniam/greenapp .

docker-push:
	docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
	docker push pessniam/blueapp
	docker push pessniam/greenapp

kubectl-config:
	aws eks --region us-west-2 update-kubeconfig --name EksCluster-c9qMPZrayphT
	kubectl config use-context arn:aws:eks:us-west-2:568283627415:cluster/EksCluster-c9qMPZrayphT
	kubectl apply -f ./INFRA/K8s/aws-auth-config.yaml

deploy-blue:
	kubectl apply -f ./INFRA/K8s/blue-controller.yaml
	kubectl apply -f ./INFRA/K8s/blue-service.yaml
	kubectl get pods
	kubectl describe service
	kubectl get service
	kubectl get svc
	kubectl get rs
	
deploy-green:
	kubectl apply -f ./INFRA/K8s/green-controller.yaml
	kubectl apply -f ./INFRA/K8s/green-service.yaml
	kubectl get pods
	kubectl describe service
	kubectl get service
	kubectl get svc
	kubectl get rs
	
all: lint docker-build docker-push kubectl-config deploy-blue deploy-green