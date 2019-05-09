docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull
alias git='docker run --rm -it -v `pwd`:/git alpine/git'
alias python='docker run --rm -it -v `pwd`:/usr/src/app sweenig/python-3'
alias ansible-playbook='docker run --rm -it -v `pwd`:/ansible/playbooks sweenig/ansible-docker'
alias groovy='docker run --rm -it -v `pwd`:/home/groovy/scripts -w /home/groovy/scripts groovy groovy'
alias f='open -a Finder ./'
alias ll='ls -FGlAhp'
export PS1='$(pwd)> '
