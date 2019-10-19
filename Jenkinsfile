pipeline {
    agent {
    docker {
      label 'windows'
      image 'mcr.microsoft.com/powershell'
    }
  }
     stages {
        stage('Build') {
            steps{
                echo "Hello World"    
            }
            
        }
     }

}