pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                git url: 'https://github.com/renupoc/Sample_Docker_Project.git', branch: 'main'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t renu_img .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker stop cont5 || true'
                sh 'docker rm cont5 || true'
                sh 'docker run -d -p 8085:80 --name cont5 renu_img'
            }
        }
    }
}
