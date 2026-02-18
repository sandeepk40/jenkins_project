pipeline {
    agent any

    environment {
        FLUTTER_HOME = "/opt/flutter"
        PATH = "${FLUTTER_HOME}/bin:${env.PATH}"
    }

    options {
        timestamps()
        skipDefaultCheckout(true)
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Flutter Info') {
            steps {
                sh 'flutter --version'
                sh 'flutter doctor -v'
            }
        }

        stage('Clean') {
            steps {
                sh 'flutter clean'
            }
        }

        stage('Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }

        stage('Tests') {
            steps {
                sh 'flutter test'
            }
        }

        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
            }
        }

        stage('Build AAB') {
            steps {
                sh 'flutter build appbundle'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'build/app/outputs/**/*.apk', fingerprint: true
            archiveArtifacts artifacts: 'build/app/outputs/**/*.aab', fingerprint: true
        }
    }
}
