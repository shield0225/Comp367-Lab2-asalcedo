pipeline {
    agent any

    stages {
	stage('Checkout') {
	    steps {
		git credentialsId: 'github-PAT', branch: 'main', url: 'https://github.com/shield0225/Comp367-Lab2-salcedo.git'
	    }
	}	

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

	stage('Test') {
	    steps {
		sh 'mvn test'
	    }
	}

        stage('Code Coverage') {
            steps {
                sh 'mvn jacoco:prepare-agent test jacoco:report'
            }
        }

	stage('Docker Build') {
	    steps {
		script {
		    docker.build(docker.build('shieldsalcedo/maven-app-auto:latest'))
		}
	    }
	}

	stage('Docker Login') {
	    steps {
		script {
		    docker.withRegistry('', 'docker-login')
		}
	    }
	}

	stage('Docker Push') {
	    steps {
		script {
		    docker.withRegistry('', 'docker-login') {
			docker.image('shieldsalcedo/maven-app-auto:latest').push()
		    }
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
