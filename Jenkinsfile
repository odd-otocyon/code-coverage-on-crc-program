pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo "Lancement du container"

                script {
                  sh 'docker-compose up'
                }

                echo "fin"
            }
        }
    }
}
