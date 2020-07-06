         ___        ______     ____ _                 _  ___  
        / \ \      / / ___|   / ___| | ___  _   _  __| |/ _ \ 
       / _ \ \ /\ / /\___ \  | |   | |/ _ \| | | |/ _` | (_) |
      / ___ \ V  V /  ___) | | |___| | (_) | |_| | (_| |\__, |
     /_/   \_\_/\_/  |____/   \____|_|\___/ \__,_|\__,_|  /_/ 
 ----------------------------------------------------------------- 


Hi there! Welcome to AWS Cloud9!

To get started, create some files, play with the terminal,
or visit https://docs.aws.amazon.com/console/cloud9/ for our documentation.

Happy coding!

---------------------------------

# DevOps Capstone

### The Scope of the Project
- This will be a blue-green deployment aka parallel deployment in AWS EKS (Kuberentes Service)
- The Pipeline Deployment will simulate a simple procedure

1. Linting Webfiles
2. Building the Docker Images for the Nginx Webserver
3. Pushing the Docker Images to Docker Hub
4. Configuring local Kuberentes(Kubectl with AWS EKS infrastructure that is created with CloudFormation)
5. Doing the Blue Deployment and Creating is Service as LoadBalancer
6. Same for the Green Deployment
7. Having someone to check both deployments, if satisfactory, routing the Blue Service to Green ReplicationController App
8. Deleting the Green Service and Blue ReplicationController for saving resources

The Jenkins Server is created manually within the network setup for EKS infrastructure,
and limited only to my private IP. For its configuration seee INFRA/Jenkins.sh

- Dont forget to Install the CLoudBees AWS Credentials and Blue Ocean, also setup Docker Hub credentials.

Look at the files for more information about the whole setup, its pretty self-explanatory.

