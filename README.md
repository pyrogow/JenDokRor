# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
1. docker build -t jenkinstimage -f Jenkins_Dockerfile .

2. docker run -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock --privileged=true --name jenkinscontainer jenkinstimage

3. Add docker pipepline plugin in jenkins WEB

4. Create Pipepline JOB with CMS Git credentials

5. Run this JOB

# NOTE: If you will probaly have some problem with docker.sock type this two command as root user:

1. chown root:docker /var/run/docker.sock

2. chmod g+w var/run/docker.sock

