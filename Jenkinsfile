pipeline {
    agent any
    environment {
        PATH = "/var/lib/jenkins/.local/bin:$PATH"
    }
    stages {
        stage('git checkout') {
            steps {
                git branch: 'root-module', credentialsId: 'ca2f7adf-ba98-4cce-bcdb-acdfe1dc6ab8', url: 'https://github.com/bhawna01bhatt/subnet_module.git'
            }
        }
        stage('Credential-scanning') {
            steps {
                sh 'gitleaks detect -v'
            }
        }
        stage('Initialization') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Validation & Security Scanning') {
            parallel {
                stage('Validation') {
                    steps {
                        sh 'terraform validate'
                    }
                }
                stage('Static Code Analysis') {
                    steps {
                        // Run tflint and save the output to a file
                        sh 'tflint --format default | tee tflint_report.json'
                    }
                }
                stage('Security and Compliance') {
                    steps {
                        script {
                            sh 'checkov --directory /var/lib/jenkins/workspace/ASG_wrapper || true'
                        } 
                    }
                }
            }
        }
        stage('Infra Cost') {
            steps {
                withCredentials([string(credentialsId: 'INFRACOST_API_KEY', variable: 'INFRACOST_API_KEY')]) {
                    sh 'infracost breakdown --path . --format html > infracost_report.html'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}
