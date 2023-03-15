pipeline {
    environment{
        imageName=""
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
                    sh 'JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64'
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
        stage('Deploy') {
            steps {
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'deploy-docker/inventory',
                 playbook: 'deploy-docker/spe-deploy.yml', sudoUser: null, extras: '-e "image_name=anuj2102/spe_miniproject"'
            }
        }
    }
}
