pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git changelog: false, poll: false, url: 'https://github.com/MoAlaaElden/Python-Webapp.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh "make image"
            }
        }
        stage('Docker Push') {
            steps {
                script{
                    withDockerRegistry(credentialsId: '874205a4-2606-4441-a2f6-8f9893068d24', toolName: 'docker') {

                        sh "make push"
                    }
                }
            }
        }
        stage('Docker Deploy') {
            steps {
                script{
                    withDockerRegistry(credentialsId: '874205a4-2606-4441-a2f6-8f9893068d24', toolName: 'docker') {

                        sh "docker images"
                        sh "docker run -d --rm -it -p 5000:5000 moalaa/python-webapp:latest"
                    }
                }
            }
        }
    }
}