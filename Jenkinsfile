pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        post {
            success {
                echo 'Build was successful.'
            }
            failure {
                echo 'Build failed.'
            }
        }
    }
}