pipeline {
    agent {
      dockerfile {
        filename 'ci/Dockerfile'
        label 'windows'
      }
    }
    options{
        timeout(2)
    }

     stages {
        stage('Build') {
            steps{
                bat "where cmake"
                cmakeBuild buildDir: 'build', installation: 'InSearchPath', steps: [[withCmake: true]]
//                 bat "c:\\temp\\startup.cmd"
//                bat "python setup.py build"
            }
            
        }
    }
//        stage('Wheel') {
//            steps{
//                bat "python setup.py bdist_wheel"
//            }
//            post{
//                cleanup{
//                    cleanWs(
//                        deleteDirs: true,
//                        patterns: [
//                            [pattern: 'dist', type: 'INCLUDE'],
//                            [pattern: 'build', type: 'INCLUDE'],
//                            [pattern: '*.egg-info', type: 'INCLUDE'],
//                            ]
//                        )
//                }
//            }
//
//        }
//     }
//     post{
//        cleanup{
// THIS DOESN'T WORK IF GIT ISN'T INSTALLED
//            bat "git clean -d -f"
//        }
//     }
}
