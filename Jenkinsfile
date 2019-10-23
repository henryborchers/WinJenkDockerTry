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
                bat "python setup.py build"
            }
            
        }
        stage('Wheel') {
            steps{
                bat "python setup.py bdist_wheel"
            }
            post{
                cleanup{
                    cleanWs deleteDirs: true, patterns: [[pattern: 'dist', type: 'INCLUDE']]
                }
            }

        }
     }
}
