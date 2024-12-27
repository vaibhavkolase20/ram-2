pipeline {
    agent { label 'node' }

    stages {
        stage('Install Docker') {
            steps {
                script {
                    // Docker इन्स्टॉलेशनसाठी शेल स्क्रिप्ट
                    try {
                        def installDockerCmd = '''
                            echo "Updating apt package list"
                            sudo apt-get update -y

                            echo "Installing prerequisites"
                            sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

                            echo "Adding Docker GPG key"
                            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

                            echo "Adding Docker repository"
                            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

                            echo "Updating apt package list again"
                            sudo apt-get update -y

                            echo "Installing Docker"
                            sudo apt-get install docker-ce -y

                            echo "Starting Docker service"
                            sudo systemctl start docker

                            echo "Enabling Docker to start on boot"
                            sudo systemctl enable docker
                        '''

                        // नोडवर Docker इन्स्टॉल करण्यासाठी शेल स्क्रिप्ट चालवा
                        sh installDockerCmd
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Docker इन्स्टॉलेशनमध्ये काही समस्या आली आहे. कृपया तपासा."
                    }
                }
            }
        }

        stage('Verify Docker Installation') {
            steps {
                script {
                    try {
                        sh 'docker --version'
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Docker इन्स्टॉलेशनची पडताळणी करण्यास अयशस्वी."
                    }
                }
            }
        }
    }
}
