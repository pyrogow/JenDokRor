# Hello-World from RoR inside docker container inside docker container))
Docker + Jenkins + Git + RoR
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
1. docker build -t jenkinstimage -f Jenkins_Dockerfile .

2. docker run -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock --privileged=true --name jenkinscontainer jenkinstimage

3. Add docker pipepline plugin in jenkins WEB

4. Create Pipepline JOB with CMS Git credentials

5. Run this JOB

# NOTE: If you will probably have some problem with docker.sock type this two command as root user:

1. chown root:docker /var/run/docker.sock

2. chmod g+w var/run/docker.sock

# Helpfull info:

command to connect to container with specific user "-u $USER":

docker exec -it -u $USER jenkinscontainer bash

command to see Jenkins login password:

cat /var/jenkins_home/secrets/initialAdminPassword