pipeline {
    agent {
      docker {
        image 'coverage:1.0'
        args '-v $WORKSPACE/:/code'
      }
    }
    stages {
        stage('build') {
            steps {
              echo "############################################################"
              echo "#                        BUILD                             #"
              echo "############################################################"
              sh "sh launchCompil.sh"
            }
        }
    }
    post {
      always {
        step([$class: 'CoberturaPublisher',
          autoUpdateHealth: false,
          autoUpdateStability: false,
          coberturaReportFile: 'build/coverage/cobertura/coverage.xml',
          failUnhealthy: false,
          failUnstable: false,
          maxNumberOfBuilds: 0,
          onlyStable: false,
          sourceEncoding: 'ASCII',
          zoomCoverageChart: false
        ])
      }
    }
}
