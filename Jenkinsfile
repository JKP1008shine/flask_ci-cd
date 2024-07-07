pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'flask-ci-cd'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/JKP1008shine/flask_ci-cd.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 5000:5000 $DOCKER_IMAGE'
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            sh 'docker stop $(docker ps -q) || true'
            sh 'docker rm $(docker ps -a -q) || true'
        }
    }
}

