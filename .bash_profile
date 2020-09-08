file_age() {
  local filename=$1
  echo $(( $(date +%s) - $(date -r $filename +%s) ))
}
is_stale() {
  local filename=$1
  local max_minutes=720
  [ $(file_age $filename) -gt $(( $max_minutes*60 )) ]
}

if is_stale .dockerupdated; then
  echo "Docker images have not been updated recently. Updating..."
  docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull
  touch .dockerupdated  
else
  echo "Docker has been updated recently. Not updating."
fi
web () {
	docker run --rm -d -p "$1":80 -v `pwd`:/usr/local/apache2/htdocs/ httpd:latest
}
mysql () {
	SAKILADBIP=$(docker inspect "$1" --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}')
	docker run --rm -it mariadb mysql --host $SAKILADBIP -p
}
alias python='docker run --rm -it -v `pwd`:/usr/src/app sweenig/python-3'
alias ansible-playbook='docker run --rm -it -v `pwd`:/ansible/playbooks sweenig/ansible-docker'
alias groovy='docker run --rm -it -v `pwd`:/home/groovy/scripts -w /home/groovy/scripts groovy groovy'
alias groovysh='docker run --rm -it mausch/docker-groovysh'
alias f='open -a Finder ./'
alias dir='ls -FGlAhp'
alias ls='ls -FGlhp'
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PS1="\[\033[33;1m\]\w\[\033[m\]\$ "
mcd () {
	mkdir "$1" && cd "$1"
}
export HISTCONTROL=$HISTCONTROL:ignorespace:ignoredups
