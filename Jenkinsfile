pipeline{
    agent any
    tools {
        terraform 'terraform'
    }
    parameters{
        choice(name:'ACTION', choices:['plan', 'apply', 'destroy'])
    }
    environment{
        ACTION = "${params.ACTION}"
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')

        
    }
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'app-load-balancer', credentialsId: 'git-ssh', url: 'git@github.com:abdohsn/daem-infra-enhanced.git'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform apply'){
            when{
                anyOf{
                    environment name: 'ACTION', value: 'apply';
                }
            }
            steps{
                sh 'terraform apply --auto-approve'
                echo "Hello"
            }
        }
        stage('Terraform Destroy'){
            when {
                anyOf{
                    environment name: 'ACTION', value: 'destroy';
                }
            }
            steps{
                sh 'terraform destroy --auto-approve'
            }
        }
        stage('Terraform Plan'){
            when {
                anyOf{
                    environment name: 'ACTION', value: 'plan';
                }
            }
            steps{
                sh 'terraform plan'
            }
        }

    }

}
