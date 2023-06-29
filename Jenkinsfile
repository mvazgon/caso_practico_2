pipeline{
    agent any
    stages{

        stage("Check if Terraform and Azure-cli are on node"){
            steps{
                sh '''
                    az login -u manuel.vazquez605@comunidadunir.net -p ${AZURECREDENTIAL}
               '''
            }
        }
        stage("Chequeamos el plan"){
            steps{
                sh """
                    cd terraform && terraform init && terrafom plan
                """
                }                
            }
        stage(" Chequeamos que estamos ok")
        {
            steps{
                sh """ 
                    echo "Semos los mejores"
                """                
            }
        }
    }     
    post{
        always{
            script{
                deleteDir
            }
        }
    }
}