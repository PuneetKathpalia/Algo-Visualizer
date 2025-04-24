pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-nginx-custom'
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
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove if container already exists
                    sh """
                    if docker ps -a --format '{{.Names}}' | grep -q '^${CONTAINER_NAME}$'; then
                        docker rm -f ${CONTAINER_NAME}
                    fi
                    """

                    // Run container on port 8081
                    sh "docker run -d -p ${HOST_PORT}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo "Nginx container is running at http://localhost:${HOST_PORT}"
        }
        failure {
            echo 'Pipeline failed. Check logs above.'
        }
    }
}
