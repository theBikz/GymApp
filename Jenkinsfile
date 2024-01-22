pipeline {
    agent any
    parameters {
        choice(choices: ['main', 'feature'], description: 'Select the branch to build', name: 'branch')
    }
    options {
        pipelineTriggers([githubPush()])
    }
    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branch: "${params.branch}", extensions: [], userRemoteConfigs: [[url: 'https://github.com/theBikz/GymApp']])
                echo "successfully build"
            }
        }
        stage("Build"){
            steps{
                script{
                    sh "docker run -d -p 3000:3000 gymapp"
                }
            }
        }
    }
    post {
        success {
            emailext subject: "SUCCESS: Pipeline ${env.JOB_NAME}",
                      body: "Build ${currentBuild.number} was successful.",
                      to: 'bpnmnu@gmail.com'
        }
        failure {
            emailext subject: 'Pipeline Failed',
                      body: 'The Jenkins pipeline build failed. Please check the build logs for details.',
                      to: 'bpnmnu@gmail.com',
                      attachLog: true
        }
    }
}