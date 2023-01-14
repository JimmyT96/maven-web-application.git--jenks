pipeline{
  agent any 
  tools {
    maven "maven3.8.6"
  }  
  stages {
    stage('1GetCode'){
      steps{
        sh "echo 'cloning the latest application version' "
        git credentialsId: 'Githubcredentials', url: 'https://github.com/JimmyT96/maven-web-application.git--jenks.git'
      }
    }
    stage('3Test+Build'){
      steps{
        sh "echo 'running JUnit-test-cases' "
        sh "echo 'testing must passed to create artifacts ' "
        sh "mvn clean package"
      }
    }
    stage('4CodeQuality'){
      steps{
        sh "echo 'Perfoming CodeQualityAnalysis' "
        sh "mvn sonar:sonar"
      }
    }
    
    //stage('5uploadNexus'){
     // steps{
     //   sh "mvn deploy"
      //}
   // } 

    stage('8deploy2prod'){
      steps{
        deploy adapters: [tomcat9(credentialsId: 'Tomcat-credentials', path: '', url: 'http://18.182.36.207:8080/')], contextPath: null, war: 'target/*war'
      }
    }
}
/*
  post{
    always{
      emailext body: '''Hey guys
Please check build status.

Thanks
Engineer Jimmy''', recipientProviders: [buildUser(), developers()], subject: 'success', to: 'fintech teams'
    }
    success{
      emailext body: '''Hey guys,
good job build and deployment successful

Thanks
EngineerJimmy''', recipientProviders: [buildUser(), developers()], subject: 'success', to: 'fintech teams'
    } 
    failure{
      emailext body: '''Hey guys
Build failed. Please resolve issues.

Thanks
Engineer Jimmy''', recipientProviders: [buildUser(), developers()], subject: 'success', to: 'fintech teams'
    }
  } 
}
*/
}
