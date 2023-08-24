pipeline{
    tools{
        maven 'mymaven'
    }
    agent {label'worker_node'}
    stages{
        stage('Clone a Repo'){
            steps{
                git 'https://github.com/imblessingdavid/edu_IGP.git'
            }

        }
        stage('Compiling the Code'){
            steps{
                sh 'mvn compile'
            }
        }
        stage('Testing the Code'){
            steps{
                sh 'mvn test'
            }
            post{
                success{
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Packaging the Code'){
            steps{
                sh 'mvn clean install package'
            }
        }
    }
}
