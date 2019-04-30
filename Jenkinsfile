pipeline {
    agent {
      docker {
        image 'coverage:1.0'
        args '-v .:/code'
      }
    }
    stages {
        stage('build') {
            steps {
                sh "gcc --version"
            }
        }
    }
}
