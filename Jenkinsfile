pipeline {
    agent any
        dockerfile {
                    filename 'RubyApp_Dockerfile'
                    echo "Succesfully builded"
                }
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
        // stage('Installing Docker') {
        //     steps {
        //        script {             
        //             sh "apt-get update"
        //             sh "apt-get install docker-ce docker-ce-cli containerd.io"
        //             echo "Succesfully builded"
        //         }  
        //     }
        // } 
        stage('Build') {
            steps {
                // dockerfile {
                //     filename 'RubyApp_Dockerfile'
                //     echo "Succesfully builded"
                // }
                script {            
                    docker.build("finalapp")
                    echo "Succesfully builded"
                }  
            }
        }
    }
}
