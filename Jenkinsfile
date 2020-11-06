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
                echo "HELLO"
                echo "$whoami"    
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
                script { 
                    echo "${whoami}"               
                    docker.build("finalAPP")
                    echo "Succesfully builded"
                }  
            }
        }
    }
}
