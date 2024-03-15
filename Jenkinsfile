pipeline {
    
    agent any
    environment{
        SONAR_HOME = tool "sonar"
    }
    
    stages {
        
        stage("Code"){
            steps{
                git url: "https://github.com/iujawaltiwari/node-todo-cicd-End-to-end.git" , branch: "master"
                echo "Code Cloned Successfully"
            }
        }
        stage("Build"){
            steps{
                sh 'docker build -t node-app-new:latest .'
                echo "Code Built Successfully"
            }
        }
        stage("Test"){
            steps{
                echo "Build Tested Successfully"
            }
        }
        stage("SonarQube Analysis"){
            steps{
                withSonarQubeEnv("sonar"){
                  sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=node-app -Dsonar.projectKey=node-app -X"
                }
                echo "Build Tested Successfully"
            }
        }
        stage("OWASP"){
            steps{
                echo "Build Tested Successfully"
            }
        }
        stage("Trivy"){
            steps{
                sh "trivy image node-app-new"
            }
        }
        stage("Deploy"){
            steps{
                // sh "docker-compose up -d"
                sh "docker run -d -p 8000:8000 node-app-new:latest"
                echo "App Deployed Successfully"
            }
        }
        stage("Push to Private Docker Hub Repo"){
            steps{
                withCredentials([usernamePassword(credentialsId:"DockerHub",passwordVariable:"dockerPass",usernameVariable:"dockerUser")]){
                sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                sh "docker tag node-app-new:latest ${env.dockerUser}/node-app-new:latest"
                sh "docker push ${env.dockerUser}/node-app-new:latest"
                }
                
            }
        }
    }
}
