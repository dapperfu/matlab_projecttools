pipeline {
  agent any
  stages {
    stage('') {
      steps {
        writeFile(file: 'hello', text: 'world', encoding: 'UTF-8')
        timestamps() {
          bat(script: 'ipsum.bat', encoding: 'UTF-8', returnStatus: true, returnStdout: true, label: 'Lorem')
        }

      }
    }
  }
  environment {
    FOO = 'BAZ'
  }
}