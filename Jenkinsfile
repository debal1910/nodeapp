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
		sh "aws --version"
		sh "docker login -u AWS -p \$(aws ecr get-login-password --region us-east-1) 920445221516.dkr.ecr.us-east-1.amazonaws.com && sleep 2"
                sh "docker build . -t 920445221516.dkr.ecr.us-east-1.amazonaws.com/assignment"
                sh "docker push 920445221516.dkr.ecr.us-east-1.amazonaws.com/assignment"
            }
        }

        stage('Deploy to app'){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'app host', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'sh /home/ubuntu/test.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
     }
}
