pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/theBikz/GymApp']])
                echo "successfully build"
            }
        }
        stage("Build"){
            steps{
                script{
                    sh "npm install"
                }
            }
        }
    }
}