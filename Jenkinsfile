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
    stage('Build container') {
      agent any
      steps {
        script {

            sh "docker build -t petclinic:latest ."
        }
      }
    }
  }
}
