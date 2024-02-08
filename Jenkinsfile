// Based on:
// https://raw.githubusercontent.com/redhat-cop/container-pipelines/master/basic-spring-boot/Jenkinsfile

library identifier: "open-shift-demo",
retriever: modernSCM(
  [
    $class: "GitSCMSource",
    remote: "https://github.com/bhatimranamin/open-shift-demo.git"
  ]
)

// The name you want to give your Spring Boot application
// Each resource related to your app will be given this name
appName = "open-shift-demo-v2"

pipeline {
    // Use the 'maven' Jenkins agent image which is provided with OpenShift
    agent { label "maven" }
    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }
        stage("Docker Build") {
            steps {
                // This uploads your application's source code and performs a binary build in OpenShift
                // This is a step defined in the shared library (see the top for the URL)
                // (Or you could invoke this step using 'oc' commands!)
                binaryBuild(buildConfigName: open-shift-demo-v2, buildFromPath: ".")
            }
        }

        // You could extend the pipeline by tagging the image,
        // or deploying it to a production environment, etc......
    }
}