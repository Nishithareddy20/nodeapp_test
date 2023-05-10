pipeline {
  environment {
    dockerImageName = "bhanubandi1999/product-front-end"
  }
  agent any
  stages{
    stage('source clone'){
      steps {
        git branch: 'master', credentialsId: 'github', url: 'https://github.com/Nishithareddy20/nodeapp_test.git'
      }
    }
    stage('docker build'){
      steps {
       sh "docker build -t ${dockerImageName} -f Dockerfile ."
      }
    }
    stage('docker login'){
      environment {
        registryCredential = 'em_ashok'
        passwordVariable = 'bhanu@111'
        usernameVariable = 'bhanubandi1999'
      }
      steps {
        withCredentials([usernamePassword(credentialsId: "${registryCredential}",  passwordVariable: 'bhanu@111', usernameVariable: 'bhanubandi1999')]) {
          sh "docker login -u ${usernameVariable} -p ${passwordVariable}"
          sh "docker push ${dockerImageName}"
        }
      }
    }
   stage('k8 apply'){
  steps {
    script {
      kubernetesDeploy(configs: "deploymentservice.yaml", kubeconfigId: "kubernetes")
      sh 'sudo kubectl apply -f deploymentservice.yaml'
        }
      }
    }
  }
}

