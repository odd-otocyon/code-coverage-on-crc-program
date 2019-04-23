pipeline {
    agent { docker { image 'coverage:1.0' } }
    stages {
        stage('build') {
            steps {
                sh 'gcc --version'
            }
        }
    }
}
