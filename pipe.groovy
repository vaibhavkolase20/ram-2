pipeline {
    agent any

    stages {
        stage('Print Env Vars') {
            steps {
                script {
                    echo "JAVA_HOME: ${env.JAVA_HOME}"  // Print JAVA_HOME environment variable
                    echo "WORKSPACE: ${env.WORKSPACE}"  // Print the workspace path
                }
            }
        }
    }
}
