pipeline{
    agent any
     stages {
        stage('Git Checkout') {
          steps {
            echo "Checkout"
            checkout scm
          }
        }
        stage('Building Docker Image'){
            steps{
                echo 'Testing'
                sh 'docker --version'
            }
        }
        stage('Deploy'){
            steps{
		sh "eval \$(aws ecr get-login-password --region us-east-1 | docker login -u AWS -p 920445221516.dkr.ecr.us-east-1.amazonaws.com) && sleep 2"
                sh "docker build . -t 920445221516.dkr.ecr.us-east-1.amazonaws.com/debal-assignment"
                sh "docker push 920445221516.dkr.ecr.us-east-1.amazonaws.com/debal-assignment:latest"
            }
        }
     }
}
