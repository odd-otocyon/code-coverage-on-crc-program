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
            cobertura([cobertura autoUpdateHealth: false,
              autoUpdateStability: false,
              conditionalCoverageTargets: '70, 0, 0',
              enableNewApi: true,
              failUnhealthy: false,
              failUnstable: false,
              lineCoverageTargets: '80, 0, 0',
              maxNumberOfBuilds: 0,
              methodCoverageTargets: '80, 0, 0',
              onlyStable: false, sourceEncoding: 'ASCII',
              zoomCoverageChart: false
            ])
        }
    }
}
