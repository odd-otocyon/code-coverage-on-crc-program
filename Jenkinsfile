pipeline {
    agent { docker { image 'alpine-gcc:1.0' } }
    stages {
        stage('build') {
            steps {
                sh 'gcc --version'
            }
        }
    }
}