pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Run') {
            steps {
                sh 'nohup java -jar target/comp367_welcome_web_app-0.0.1-SNAPSHOT.jar --server.port=9091 &'
            }
        }
    }
    post {
        success {
            echo 'Build and run were successful.'
        }
        failure {
            echo 'Build or run failed.'
        }
    }
}
