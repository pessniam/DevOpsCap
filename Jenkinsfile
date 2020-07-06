pipeline {

    environment {
        dockerHubCredentials = 'DockerHub'
    }

    agent any
    stages {
        stage('Lint the HTML') {
            steps {
                sh 'make lint'
            
            }
        
        }
        stage('Build Docker Images'){
            steps {
                sh 'make docker-build'
            
            }
        
        }
        stage('Push Docker Images to DockerHub'){
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]){
               sh 'make docker-push'
              }
            
            }
        
        }
        
        stage('Kubectl Config') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-creds') {
					sh 'make kubectl-config'
				}
			}
		}    
        
        stage('Deploy to Blue - Production') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-creds') {
					sh 'make deploy-blue'
				}
			}
		}
		
		stage('Deploy To Green - Test') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-creds') {
					sh 'make deploy-green'
				}
			}
		}
		
		stage('CTO Approval') {
            steps {
                input "Ready to redirect traffic to green/TestEnv for verification before updating Blue/Production?"
            }
        }

		
		
    
    }



}