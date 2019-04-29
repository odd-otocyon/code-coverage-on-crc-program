pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo "Lancement du container"

                script {
                  docker-compose up
                }

                echo "fin"
            }
        }
    }
}
