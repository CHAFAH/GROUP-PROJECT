pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/CHAFAH/KAMSTRUP-PROJECT.git'
            }
        }

        stage('Maven Clean Package') {
            steps {
                script {
                    def mavenHome = tool name: "Maven-3.9.3", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
                }
            }
        }
      }
}
