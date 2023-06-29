pipeline{
    agent any
    stages{
        stage("Check if Terraform and Azure-cli are on node"){
            steps{
                sh '''
                    az login -u manuel.vazquez605@microsoft.com -p nu3l201DVazq_
               '''
            }
        }
        stage("Chequeamos el plan"){
            steps{
                sh """
                    cd terraform && terrafom plan
                """
                }                
            }
            
        }
        stage(" Chequeamos que estamos ok")
        {
            steps{
                sh """ 
                    Semos los mejores
                """                
            }
        }
    }       
}
