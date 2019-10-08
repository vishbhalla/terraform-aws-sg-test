pipeline {
    agent any
    stages {
        stage('Production Plan') {
             steps {
                script {
                    sh '''
                        git merge production
                        alias terraform=/var/lib/jenkins/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/terraform_0.12.9/terraform
                        export TF_IN_AUTOMATION=1
                        terraform init -input=false
                        terraform plan -out=tfplan.prod.''' + ${env.BUILD_NUMBER} + ''' -input=false
                        aws s3 cp ./tfplan s3://410830981177-vish-tfstate/prod-plans/
                    '''
                }
            }
        }
        stage('Staging Plan') {
             steps {
                script {
                    sh '''
                        git merge staging
                        terraform init -input=false
                        terraform plan -out=tfplan.staging.''' + ${env.BUILD_NUMBER} + ''' -input=false
                        aws s3 cp ./tfplan s3://410830981177-vish-tfstate/staging-plans/
                    '''
                }
            }
        }
	}
}
