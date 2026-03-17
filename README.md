Docker CI/CD Project using Jenkins

Project Overview
This project demonstrates how to build and deploy a Dockerized web application using a Jenkins CI/CD pipeline.
It automates the process from code push to container deployment on an EC2 instance.
---
Tech Stack
* 🐳 Docker
* ⚙️ Jenkins
* 🌐 Nginx
* ☁️ AWS EC2
* 🧑‍💻 GitHub

---

## 📁 Project Structure
```
docker-Sample-project/
│── Dockerfile
│── index.html
│── Jenkinsfile
```
How It Works
1. Developer pushes code to GitHub
2. Jenkins pulls the latest code
3. Docker image is built using Dockerfile
4. Existing container is stopped and removed
5. New container is deployed automatically

 Dockerfile

```dockerfile
FROM nginx
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
```

Jenkins Pipeline
```groovy
pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                git url: 'https://github.com/renupoc/Sample_Docker_Project.git', branch: 'main'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t renu_img .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker stop cont5 || true'
                sh 'docker rm cont5 || true'
                sh 'docker run -d -p 8085:80 --name cont5 renu_img'
            }
        }
    }
}
```

---

How to Run Locally

### Step 1: Build Image
```
docker build -t renu_img .
```

### Step 2: Run Container
```
docker run -d -p 8080:80 renu_img
```

### Step 3: Access Application
```
http://<your-ec2-ip>:8080
```

---
Jenkins Setup

1. Install Jenkins on EC2
2. Install required plugins (Git, Docker Pipeline)
3. Configure pipeline job
4. Connect GitHub repository

---

 Output
Application will be available at:
```
http://<your-ec2-ip>:8085
```
---

Key Learnings..

* Docker image creation and container management
* Jenkins pipeline automation
* CI/CD workflow implementation
* Troubleshooting real-world issues

---
Conclusion
This project demonstrates a complete DevOps workflow using Docker and Jenkins. It simulates a real-world CI/CD pipeline used in production environments.
---

Author
Renu
