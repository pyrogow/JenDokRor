pipeline {
    agent any
    
    stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/pyrogow/JenDokRor.git"
                echo "Succesfully cloned"
            }
        }
        // stage ('unit test and build') {
        //     steps {
        //         sh 'mvn clean package'
        //     }
        // }
        stage('Prepare to Build') {
           steps {
               echo "We are ready to build"
           }
       }
       stage('Build') {
           steps {
               script {             
                   docker.build("finalAPP")
                   echo "Succesfully builded"
               }  
           }
       }
    }
}
