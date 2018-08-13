#!/bin/env groovy

pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker {
          image 'maven:3.5.3-alpine'
          args '-v /root/.m2:/root/.m2'
        }
      }
      steps {
          sh 'mvn clean install -B'
      }
    }
    stage('构建镜像') {
      agent any
      steps {
        script {
            pom = readMavenPom file: 'pom.xml'
            TAG = pom.version
            sh "docker build -t petclinic:${TAG} ."
        }
      }
    }
  }
}
