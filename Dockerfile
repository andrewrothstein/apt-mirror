FROM ubuntu:trusty
MAINTAINER "Andrew Rothstein" <andrew.rothstein@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get install -y ansible
ADD ansible.cfg /etc/ansible/ansible.cfg
ADD localhost /etc/ansible/hosts
ADD ansible /ansible
WORKDIR /ansible
RUN ansible-galaxy install --ignore-errors requirements.yml
RUN ansible-playbook playbook.yml