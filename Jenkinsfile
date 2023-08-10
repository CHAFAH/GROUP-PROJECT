pipeline {
    agent any

    stages {
        stage('GIT_SRC_CLONE') {
            steps {
                git branch: 'master', url: 'https://github.com/CHAFAH/GROUP-PROJECT.git'
            }
        }
        stage('MAVEN BUILD') {
            steps {
                script{
                    def mavenHome = tool name: "maven3.9.4", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
                }
            }
        }
        stage('CODE_COVERAGE') {
            steps {
                script{
                    def mavenHome = tool name: "maven3.9.4", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} sonar:sonar"
                }
            }
        } 
        stage('DEPLOY_ARTIFACTS') {
            steps {
                script{
                    def mavenHome = tool name: "maven3.9.4", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} deploy"
                }
            }
        }    
   }
}
