# How to create maven in ubuntu 
 
 1) first you create java
     sudo apt install fontconfig openjdk-17-jre

 2) copy packege
    curl -O https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz

 3) extrack the file 
  tar xzvf apache-maven-3.9.9-bin.tar.gz

 4) move this file into /bin directory
    mv  apache-maven-3.9.9 /opt/apache-maven

 5) after moving directory go to /opt and edit vim /etc/profile (add there this contain at last)
    export PATH$PATH: '/opt/apache-maven/bin'  
   [ if this step is faile and your mvn comand don't show version then use step2]
    step2 [ nano ~/.bashrc
           export M2_HOME=/opt/maven
           export MAVEN_HOME=/opt/maven
           export PATH=${M2_HOME}/bin:${PATH}
           source ~/.bashrc ] 


 6) and check version 
   mvn --version

 7) create project using command
  
  mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false -DgroupId=my.package.path -DartifactId=myartifac

 8) this is the link of how to install maven in ubuntu
  https://www.geeksforgeeks.org/how-to-install-maven-on-linux/ 


