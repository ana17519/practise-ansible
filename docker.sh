#!/bin/bash

#start container
echo "1. run containers:"
docker run --rm -it -d --name fedora pycontribs/fedora
docker run --rm -it -d --name ubuntu ubuntu1
docker run --rm -it -d --name centos7 centos:7

#list of containers
echo "2. list of containers:"
docker ps -a

#run playbook
echo "3. run playbook:"
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

#stop containers
echo "4. stopping containers:"
docker stop ubuntu
docker stop fedora
docker stop centos7

#list of containers
echo "5. list of containers:"
docker ps -a
