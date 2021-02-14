node{
    stage('Scm Checkout'){
    git credentialsId: 'git', url: 'https://github.com/githubg2p/kubeadmin'
}
    stage('Mvn Package'){
    def mvnHome = tool name: 'maven', type: 'maven'
def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
}
     stage('Build Docker'){
     sh 'docker build -t dockerdrk/my-app:${BUILD_NUMBER} .'
}
    stage('Push Docker Image'){
    withCredentials([string(credentialsId: 'docker', variable: 'docker')]) {
     sh "docker login -u dockerdrk --password-stdin ${docker}"
}
     sh 'docker push dockerdrk/my-app:${BUILD_NUMBER}'
  

}

//stage('Remove Old Containers'){
  //  sshagent(['ec2']) {
    //  try{
      //  def sshCmd = 'ssh -o StrictHostKeyChecking=no ubuntu@65.1.134.199'
        //def dockerRM = 'docker rm -f my-kishan'
        //sh "${sshCmd} ${dockerRM}"
      //}catch(error){

      //}
    //}
  //}

   //stage('Runcontainer on dev server'){

  //def dockerRun = 'docker run -p 8080:8080 -d --name my-kishan dockerdrk/my-app:${BUILD_NUMBER}'
  //sshagent(['ec2']) {
 //sh "ssh -o StrictHostKeyChecking=no ubuntu@65.1.134.199 ${dockerRun}"
//}

//}
    stage('Deploy to k8s'){
       sh "chmod +x changeTag.sh"
       sh "./changeTag.sh ${BUILD_NUMBER}"
        sshagent(['ec2']) {
            sh "scp -o StrictHostKeyChecking=no services.yml node-app-pod.yml ubuntu@65.1.134.199:/home/ubuntu/"
            script{
            try{
               sh "ssh ubuntu@65.1.134.199 kubectl apply -f ."
               }catch(error){
               sh "ssh ubuntu@65.1.134.199 kubectl create -f ."
               }
               }
        }
    }

}


