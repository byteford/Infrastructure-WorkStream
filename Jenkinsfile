pipeline{
    agent any
    stages{
        stage("Setup"){
            steps{
                echo "========Setup========"
                npm install
            }
        }
        stage("lint"){
            steps{
                echo "========lint========"
                npm run lint
            }
        }
        stage("UnitTest"){
            steps{
                echo "========UNIT TEST========"
            }
        }
        stage("Pre build"){
            steps{
                echo "====Pre Build===="
            }
        }
        stage("Build"){
            steps{
                echo "====Build===="
            }
        }
        stage("Intergration"){
            steps{
                echo "====Intergration===="
            }
        }
        stage("Publish"){
            steps{
                echo "====Publish===="
            }
        }
    }
}