pipeline {
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
