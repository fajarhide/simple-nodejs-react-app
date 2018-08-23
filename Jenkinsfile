pipeline {
  agent {
    docker {
      image 'node:6-alpine'
      args '-p 3000:3000'
    }

  }
  stages {
    stage('Build App') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test App') {
      steps {
        sh './tasks/test.sh'
      }
    }
    stage('Delivery App') {
      steps {
        sh '''./tasks/deliver.sh
./tasks/kill.sh'''
      }
    }
  }
  environment {
    CI = 'True'
  }
}