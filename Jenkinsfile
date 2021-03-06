def  appName = 'hello-echo'
def  feSvcName = "${appName}"
def  ACRPATH = 'hackfest'
def  ACRNAME = 'acrhackfestherb6297'
def  ACRURL = 'azurecr.io'
def  imageTag = "${env.BRANCH_NAME}.${env.BUILD_NUMBER}"

pipeline {
  agent {
    kubernetes {
      label 'aks-hackfest'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
# Use service account that can deploy to all namespaces
  serviceAccountName: jenkins
  containers:
  - name: helm
    image: lachlanevenson/k8s-helm:v2.16.1
    command:
    - cat
    tty: true
  - name: azurecli
    image: microsoft/azure-cli:latest
    command:
    - cat
    tty: true
  - name: kubectl
    image: lachlanevenson/k8s-kubectl:latest
    command:
    - cat
    tty: true
"""
}
  }
  stages {

    
    stage('Build Container and Push to Registry') {
      steps {
        container('azurecli') {
        withCredentials([azureServicePrincipal('azurecli')]) {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
          sh("az acr build -t ${ACRNAME}.${ACRURL}/${ACRPATH}/${appName}:${imageTag} -r ${ACRNAME} --file './hello-echo/Dockerfile'   ./")
        }
      }
     }
    }
    stage('Publish To K8S') {
      steps {
        container('helm') {
          withCredentials([azureServicePrincipal('azurecli')]) {
            sh 'helm version'
          }
        }
      }
    }
  }
}
 
