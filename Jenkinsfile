pipeline{
    agent any
    environment{
        DOCKER_USER = 'gautamjha3112002'

    }
    stages{
        stage('Fetch code'){
            steps{
                git branch: 'master', url: 'https://github.com/gautamjha2002/Budget-app.git'
            }
        }
        stage('Build Docker image'){
            steps{
                sh 'docker build -t ${DOCKER_USER}/${JOB_NAME}_web:0.${BUILD_ID} .'
            }
        }
        
        stage('Push to DockerHub'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message: 'Approve Push to docker Hub'
                }

                withCredentials([string(credentialsId: 'dockerlogin', variable: 'dockerlogin')]) {
                    sh 'docker login -u gautamjha3112002 -p ${dockerlogin}'
                   sh 'docker push ${DOCKER_USER}/${JOB_NAME}_web:0.${BUILD_ID}'
                }

                
            }
        }  
    }
}
