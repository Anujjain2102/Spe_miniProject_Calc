pipeline {
    environment{
        PATH="/opt/apache-maven-3.9.0/bin:$PATH"
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
                    sh 'PATH="/opt/apache-maven-3.9.0/bin:$PATH"'
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
