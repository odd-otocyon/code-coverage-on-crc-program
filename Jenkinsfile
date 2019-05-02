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
        cobertura([$class: 'CoberturaPublisher',
          coberturaReportFile: 'build/coverage/cobertura/coverage.xml',
          sourceEncoding: 'UTF_8',
          enableNewApi: true
        ])
      }
    }
}
