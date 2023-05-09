pipeline {

  environment {
    dockerimagename = "nishitha20/app"
    dockerImage = ""
  }

  agent any
    stages{
    stage('source clone'){
       git branch: 'master', credentialsId: 'github', url: 'https://github.com/Nishithareddy20/nodeapp_test.git'
    }
    
    stage('docker build'){
         sh 'docker build -t nishitha20/app Dockerfile'
    }
    stage('docker login'){
        sh 'docker push nishitha20/app'
    }
    stage('k8 apply'){
        sh 'kubectl apply -f deploymentservice.yml'
    }
    
}
  }

