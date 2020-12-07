pipeline {
    environment {
        imageName = "fadeeves/flaskapp"
        dockerHubCredentials = "docker-hub"
        dockerImage = ""
    }
    agent any
    stages {
        stage("Building image") {
            steps {
                script {
                    dockerImage = docker.build imageName
                }
            }
        }
        stage("Pushing image to Docker Hub") {
            steps {
                script {
                    docker.withRegistry("", dockerHubCredentials)
                    dockerImage.push("$BUILD_NUMBER")
                    dockerImage.push("latest")
                }
            }
        }
        stage("Removing image from node") {
            steps {
                sh "docker rmi $imageName:$BUILD_NUMBER"
                sh "docker rmi $imageName:latest"
            }
        }
    }
}