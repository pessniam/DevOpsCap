sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt install python3-pip -y

sudo pip3 install awscli

sudo apt-get install -y default-jdk

sudo apt-get install -y wget tidy

sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update

sudo apt-get install -y jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

sudo systemctl start jenkins

sudo systemctl enable jenkins

sudo apt install docker.io

sudo usermod -a -G docker jenkins

sudo usermod -a -G docker ubuntu

snap install kubectl --classic