pipeline {
//    agent {
//      dockerfile {
//        filename 'Dockerfile'
//        label 'windows'
//      }
//    }
    agent {
    docker {
      label 'windows'
      image 'python:latest'
    }
  }
     stages {
        stage('Build') {
            steps{
                bat "dir"
            }
            
        }
     }

}
