pipeline {
    agent any
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/pyrogow/JenDokRor.git"
                echo "Succesfully cloned"
            }
        }
        stage('Prepare to Build') {
            steps {
                echo "We are ready to build"
                sh "pwd"
                echo "HELLO"
            }
        }
        stage('Build') {
            // agent {
            //     dockerfile {
            //         filename 'RubyApp_Dockerfile'
            //     }
            // }
            steps {
                script {            
                    docker.build("finalapp")
                    echo "Succesfully builded2"
                }  
            }
        }
    }
}
