pipeline {
    environment{
        imageName =""
    }
    agent any
    stages {
        stage('Git pull') {
            steps {
                git 'https://github.com/Anujjain2102/Spe_miniProject_Calc.git'
            }
        }
        stage('Maven Build') {
            steps {
                script{
                    sh 'mvn clean install'
                }
            }
        }
        stage('Docker Build to Image') {
            steps {
                script{
                    imageName=docker.build "anuj2102/spe_miniproject"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script{
                    docker.withRegistry('','docker-jenkins'){
                        imageName.push()
                    }
                }
            }
        }
    }
}
