pipeline {
  agent {
    docker {
      image 'node:6-alpine'
      args '-p 3000:3000'
    }
  }
  environment {
    CI = 'True'
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
        sh './tasks/deliver.sh'
        input message: 'Finished using the web site? (Click "Proceed" to continue)'
        sh './tasks/kill.sh'
      }
    }
  }
}
