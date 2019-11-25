pipeline {
  agent {
    docker {
      image 'node:lts'
    }

  }
  stages {
    stage('Install dependencies') {
      steps {
        sh 'cd backend && npm ci'
      }
    }

    stage('Build') {
      steps {
        sh '''cd backend && 
npm run build'''
      }
    }

  }
}