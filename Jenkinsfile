pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000 -p 5000:5000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './tasks/test.sh'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'staging'
            }
            steps {
                sh './tasks/deliver-staging.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './tasks/kill.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh './tasks/deploy-staging.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './tasks/kill.sh'
            }
        }
    }
}
