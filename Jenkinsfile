pipeline {
  agent {
    docker {
      image 'node:6-alpine'
      args '-p 3000:3000'
    }

  }
  stages {
    stage('Build App') {
      parallel {
        stage('Build App') {
          steps {
            sh 'npm install'
          }
        }
        stage('Build Staging') {
          steps {
            git(branch: 'staging', url: 'https://github.com/fajarhide/simple-nodejs-react-app.git', changelog: true, credentialsId: '135193ad1e41766200e73911b025372952ecbfd3')
          }
        }
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
        input 'Finished using the web site? (Click "Proceed" to continue)'
        sh './tasks/kill.sh'
      }
    }
  }
  environment {
    CI = 'True'
  }
}