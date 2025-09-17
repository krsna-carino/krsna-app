pipeline {
    agent any

    tools { maven 'MVN_HOME' }

    environment {
        SLACK_CHANNEL = "#jenkins-integration"
        NEXUS_URL = "54.237.142.141:8081"
        NEXUS_REPOSITORY = "multi-stage-job"
        NEXUS_CREDENTIAL_ID = "nexus-credits"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/krsna-carino/krsna-app.git'
            }
        }

        stage('Tool Install') {
            steps {
                echo "Use a predefined Maven installation"
            }
        }

        stage('Build & Quality') {
            parallel {
                stage('Maven Build') {
                    steps {
                        sh 'mvn clean install -Dmaven.test.failure.ignore=true'
                    }
                }
                stage('SonarQube Analysis') {
                    steps {
                        withSonarQubeEnv('SonarQube') {
                            sh '/opt/sonar_scanner/bin/sonar-scanner -Dsonar.projectKey=krsna-app -Dsonar.sources=src/main/java -Dsonar.java.binaries=target/classes'
                        }
                    }
                }
            }
        }

        stage('Artifact Management') {
            steps {
                script {
                    def pom = readMavenPom file: 'pom.xml'
                    def artifact = findFiles(glob: "target/*.${pom.packaging}")[0].path

                    nexusArtifactUploader(
                        nexusVersion: 'nexus3',
                        protocol: 'http',
                        nexusUrl: NEXUS_URL,
                        repository: NEXUS_REPOSITORY,
                        groupId: pom.groupId,
                        version: pom.version,
                        credentialsId: NEXUS_CREDENTIAL_ID,
                        artifacts: [[artifactId: pom.artifactId, file: artifact, type: pom.packaging]]
                    )
                }
            }
        }

        stage('Deployment') {
            parallel {
                stage('Deploy to Tomcat') {
                    steps {
                        withCredentials([usernamePassword(credentialsId: 'tomcat-credits', usernameVariable: 'TOMCAT_USER', passwordVariable: 'TOMCAT_PASS')]) {
                            sh """
                                curl -u $TOMCAT_USER:$TOMCAT_PASS -T target/*.war \
                                "http://54.145.50.157:8080/manager/text/deploy?path=/krsna-app&update=true"
                            """
                        }
                    }
                }
            }
        }

        stage('Notifications') {
            steps {
                slackSend(channel: SLACK_CHANNEL, color: "#36a64f", message: "✅ Pipeline completed successfully!")
            }
        }
    }

    post {
        failure {
            slackSend(channel: SLACK_CHANNEL, color: "#FF0000", message: "❌ Pipeline failed!")
        }
    }
}
