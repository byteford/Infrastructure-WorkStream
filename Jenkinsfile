pipeline{
    agent any

    stages{
        stage("Setup"){
            steps{
                echo "========Setup========"
                sh "npm install"
            }
        }
        stage("lint"){
            steps{
                echo "========lint========"
                sh "npm run lint"
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
                sh " tar -czvf  archive.tar.gz ./src/"
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
    post{
        always{
            archiveArtifacts artifacts: "archive.tar.gz", fingerprint: true, followSymlinks: false
        }

    }
}