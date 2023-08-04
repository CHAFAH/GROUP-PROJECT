pipeline {
    agent any

    stages {
        stage('DIT_SRC_CLONE') {
            steps {
                git branch: 'master', url: 'https://github.com/CHAFAH/GROUP-PROJECT.git'
            }
        }

        stage('MAVEN_CLEAN_PACKAGE') {
            steps {
                script {
                    def mavenHome = tool name: "maven3.9.4", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
                }
            }
        }
        stage('UPLOAD BUILD ARTIFACTS') {
            steps {
                script {
                    def mavenHome = tool name: "maven3.9.4", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} deploy"
                }
            }
        }
        stage('CODE_QUALITY_CHECK') {
            steps {
                sh 'mvn sonar:sonar'
            }
        }
     }
 }
