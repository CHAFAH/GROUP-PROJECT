pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/CHAFAH/GROUP-PROJECT.git'
            }
        }

        stage('Maven Clean Package') {
            steps {
                script {
                    def mavenHome = tool name: "maven3.9.4", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
                }
            }
        }
     }
 }
