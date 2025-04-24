pipeline {
    agent any

    environment {
        IMAGE_NAME = 'algo-visualizer-nginx'
        CONTAINER_NAME = 'nginx8081'
        HOST_PORT = '8081'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/PuneetKathpalia/Algo-Visualizer.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Stop Existing Container') {
            steps {
                sh """
                if docker ps -a --format '{{.Names}}' | grep -q '^${CONTAINER_NAME}\$'; then
                    docker rm -f ${CONTAINER_NAME}
                fi
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p ${HOST_PORT}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}'
            }
        }
    }

    post {
        success {
            echo "✅ App running at: http://localhost:${HOST_PORT}"
        }
        failure {
            echo "❌ Build or deployment failed. Check logs."
        }
    }
}
