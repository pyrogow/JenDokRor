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
                sh "whoami"
                echo "HELLO"
            }
        }
        stage('BUILD & RUN Finalapp') {
            // agent {
            //     dockerfile {
            //         filename 'RubyApp_Dockerfile'
            //     }
            // }
            steps {
                script {            
                    docker.build("finalapp")
                    echo "Succesfully builded"
                    sh "docker run finalapp -p 3000:3000"
                }  
            }
        }
        // stage('Run Finalapp') {
        //     steps {
        //         script {            
        //             docker.image("finalapp").withRun("-p 3000:3000")
        //             echo "Succesfully Runed"
        //         }  
        //     }
        // }
    }
}
