pipeline {
  agent {
    docker {
      image 'node:6-alpine'
      args '-p 3000:3000 -p 5000:5000'
    }

  }
  stages {
    stage('Build App') {
        stage('Build App') {
          steps {
            sh 'npm install'
          }
        }
    }
    stage('Test App') {
      steps {
        sh './tasks/test.sh'
      }
    }
    stage('Delivery App for Staging') {
      when {
        branch 'staging'
      }
      steps {
        sh './tasks/deliver-staging.sh'
        input message: 'Finished using the web site? (Click "Proceed" to continue)'
        sh './tasks/kill.sh'
      }
    }
    stage('Delivery App for Production') {
      when {
        branch 'production'
      }
      steps {
        sh './tasks/deliver-production.sh'
        input message: 'Finished using the web site? (Click "Proceed" to continue)'
        sh './tasks/kill.sh'
      }
    }
  }
  environment {
    CI = 'True'
  }
}
