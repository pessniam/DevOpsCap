pipeline {


    environment {
        dockerHubCredentials = 'DockerHub'
    }

    agent any
    stages {
        stage('Lint the HTML') {
            steps {
                sh "tidy -q -e ./blueapp/*.html"
                sh "tidy -q -e ./greenapp/*.html"
                echo "Linting the HTML"
            
            }
        
        }
        stage('Build Docker Images'){
            steps {
                sh "docker build -f blueapp/Dockerfile -t pessniam/blueapp ."
                sh "docker build -f greenapp/Dockerfile -t pessniam/greenapp ."
            
            }
        
        }
        stage('Push Docker Images to DockerHub'){
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]){
               sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
               sh "docker push pessniam/blueapp"
               sh "docker push pessniam/greenapp"
              }
            
            }
        
        }
        stage('Setup Context for Kubectl'){
            steps {
                withAWS(region:'us-west-2', credentials:'aws-creds'){
                 sh "kubectl config set-context arn:aws:eks:us-west-2:568283627415:cluster/EksCluster-hVyio5Aa89V8"
                }
            }
        
        }
        
        stage('Deploy to Blue') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-creds') {
					sh '''
						kubectl apply -f ./INFRA/K8s/blue-controller.yaml
					'''
				}
			}
		}

		stage('Deploy To Green') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-creds') {
					sh '''
						kubectl apply -f ./INFRA/K8s/green-controller.yaml
					'''
				}
			}
		}

		stage('Create Service and Redirect to Blue') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-creds') {
					sh '''
						kubectl apply -f ./INFRA/K8s/blue-service.yaml
					'''
				}
			}
		}

		stage('CTO Approval') {
            steps {
                input "Ready to redirect traffic to green?"
            }
        }

		stage('Create Service and Redirect to Green') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-creds') {
					sh '''
						kubectl apply -f ./INFRA/K8s/green-service.yaml
					'''
				}
			}
		}
    
    }


}