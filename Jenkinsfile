pipeline {
    agent any

    environment {
        IMAGE_NAME = 'algo-visualizer-nginx'
        CONTAINER_NAME = 'nginx8081'
        HOST_PORT = '8081'
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/PuneetKathpalia/Algo-Visualizer.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                script {
                    bat "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add test steps here if neededdd
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying app...'
                script {
                    bat "docker rm -f ${CONTAINER_NAME} || exit 0"
                    bat "docker run -d -p ${HOST_PORT}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo "✅ App running at: http://localhost:${HOST_PORT}"
        }
        failure {
            echo "❌ Deployment failed."
        }
    }
}
