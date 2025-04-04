## CI/CD Pipeline with Jenkins, Docker, AWS, and GitHub  

### 📌 Project Overview  
This project demonstrates a CI/CD pipeline using **Jenkins, Docker, AWS, and GitHub**. It automates the process of **building, testing, and deploying a web application**. The pipeline ensures seamless integration and delivery of the application using containerized environments.  

### 🚀 Technologies Used  
- **Jenkins** - Automates the CI/CD pipeline  
- **Docker** - Containerizes the application  
- **AWS (EC2)** - Hosts the Jenkins server and application  
- **GitHub** - Version control system  
- **Git** - Manages source code  
- **Apache2** - Web server inside Docker container  

### 📂 Project Structure  
```
📦 project-root
 ┣ 📂 src                   # Source code for the web app
 ┗  📜 README.md             # Documentation
```

### 🔧 Setup Instructions  

#### 1️⃣ Prerequisites  
Ensure you have the following installed:  
- **AWS EC2 instance** (Ubuntu recommended)  
- **Jenkins** (installed on EC2)  
- **Docker** (installed on EC2)  
- **Git** (installed locally and on EC2)  

#### 2️⃣ Setting Up Jenkins on AWS  
1. Connect to your **EC2 instance** using SSH.  
2. Install **Jenkins**:  
   ```sh
   sudo apt update && sudo apt install -y openjdk-11-jdk wget
   wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
   sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
   sudo apt update && sudo apt install -y jenkins
   sudo systemctl start jenkins && sudo systemctl enable jenkins
   ```
3. Access Jenkins at `http://<your-ec2-public-ip>:8080` and complete the setup.  

#### 3️⃣ Installing Docker  
```sh
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker jenkins  # Grant Jenkins access to Docker
sudo systemctl restart jenkins
```

#### 4️⃣ Cloning the Repository  
```sh
git clone https://github.com/yourusername/your-repo.git
cd your-repo
```

#### 5️⃣ Running the Application Locally  
```sh
docker build -t my-app .
docker run -d -p 80:80 my-app
```
Access the application in your browser at `http://localhost`.

#### 6️⃣ Configuring Jenkins Pipeline  
1. Go to **Jenkins Dashboard > New Item**  
2. Select **Pipeline** and enter project name  
3. In the **Pipeline script**, use:  
   ```groovy
   pipeline {
       agent any
       stages {
           stage('Checkout') {
               steps { git 'https://github.com/yourusername/your-repo.git' }
           }
           stage('Build') {
               steps { sh 'docker build -t my-app .' }
           }
           stage('Deploy') {
               steps { sh 'docker run -d -p 80:80 my-app' }
           }
       }
   }
   ```
4. Save and run the pipeline.  

### 📜 Additional Learning Resources  
🔗 **DevOps Assignment & Learnings from IARE**: [Google Drive Link](https://drive.google.com/drive/folders/1UriGqjJZ18x_uFq6omDPYBJJ_nq-v7xGDDyS01xRBO2nrYZDuW0FN2C1TuHJ5gfNbMOfB5dL?usp=sharing)  
