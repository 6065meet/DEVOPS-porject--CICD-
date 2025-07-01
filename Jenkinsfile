pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "6065meet/stylish-1.0.0:latest"
        K8S_NAMESPACE = "stylish-app"
    }

    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/yourusername/yourrepo.git'
            }
        }
        stage('Build Docker image') {
            steps {
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }
        stage('Push Docker image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl set image deployment/frontend frontend=$DOCKER_IMAGE -n $K8S_NAMESPACE --record"
            }
        }
    }
}
