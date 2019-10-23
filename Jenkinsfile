pipeline {
//    agent {
//      dockerfile {
//        filename 'Dockerfile'
//        label 'windows'
//      }
//    }
//    agent {
    docker {
      label 'windows'
      image 'winjenkdockertry'
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
