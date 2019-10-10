pipeline {
    agent any
    stages {
        stage('Pre Tests') {
             steps {
                script {
                    sh '''
			inspec exec test/pre -t aws://eu-west-1
		    '''
		}
	    }
	}
        stage('TF plan') {
             steps {
                script {
                    sh '''
                        alias terraform=/var/lib/jenkins/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/terraform_0.12.9/terraform
                        export TF_IN_AUTOMATION=1
                        terraform init -input=false --backend-config=backend_config/dev.tfvars
                        terraform plan -var-file=./env_vars/dev.tfvars -out=tfplan.dev -input=false
 		    '''
		}
	    }
	}			
        stage('TF apply') {
             steps {
                script {
                    sh '''
                        terraform apply ./tfplan.dev -auto-approve
                    '''
                }
            }
        }
	stage('Post Tests') {
             steps {
                script {
                    sh '''
                        inspec exec test/post -t aws://eu-west-1
                    '''
                }
            }
        }
	stage('TF plan prod') {
             steps {
                script {
                    sh '''
			terraform init -input=false --backend-config=backend_config/prod.tfvars
		    	terraform plan -var-file=./env_vars/prod.tfvars -out=tfplan.dev -input=false
                    '''
                }
            }
        }
    }
}
