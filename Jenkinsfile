pipeline {
    agent any
     stages {
        stage('Build') {
            agent {
                docker {
                  label 'windows'
                  image 'python:latest'
                }
            }
            steps{
                bat "python setup.py build"
            }
            post{
                cleanup{
                    cleanWs deleteDirs: true
                }
            }
            
        }
        stage('Wheel') {
            agent {
                docker {
                  label 'windows'
                  image 'python:latest'
                }
            }
            steps{
                bat "python setup.py bdist_wheel"
            }
            post{
                cleanup{
                    cleanWs deleteDirs: true
//                    cleanWs deleteDirs: true, patterns: [[pattern: 'dist', type: 'INCLUDE']]
                }
            }

        }
     }
     post{
        cleanup{
            cleanWs deleteDirs: true
//            cleanWs deleteDirs: true, patterns: [[pattern: '.git', type: 'EXCLUDE']]
        }
    }


}
