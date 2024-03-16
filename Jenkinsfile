pipeline {
    agent any
    tools {
	maven "MAVEN3"
    }

    stages {
	stage('Checkout') {
	    steps {
		checkout scm
	    }
	}	

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

	stage('Test') {
	    steps {
		bat 'mvn test'
	    }
	}

        stage('Generate Code Coverage') {
            steps {
                bat 'mvn jacoco:prepare-agent test jacoco:report'
            }

            post {
                always {
                    jacoco execPattern: '**/target/jacoco.exec', classPattern: '**/classes', sourcePattern: '**/src/main/java'
                }
            }
        }

	stage('Docker Build') {
	    steps {
		script {
		    docker.build('shieldsalcedo/maven-app-auto:latest')
		}
	    }
	}

	stage('Docker Login') {
	    steps {
	        script {
	            withCredentials([string(credentialsId: 'docker-login', variable: 'DOCKERHUB_PWD')]) {
                	bat "docker login -u shieldsalcedo -p %DOCKERHUB_PWD%"
            		}
	            }
	        }
	    }
	

	stage('Docker Push') {
	    steps {
		script {
		    docker.image('shieldsalcedo/maven-app-auto:latest').push()
		}
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
