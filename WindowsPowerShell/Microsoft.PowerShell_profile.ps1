docker pull sweenig/ansible-docker
function ansible-playbook {
  $allArgs = $PsBoundParameters.values + $args
  docker run --rm -it -v ${pwd}:/ansible/playbooks ansible-docker $allArgs
}

docker pull alpine/git
function git {
  $allArgs = $PsBoundParameters.values + $args
  docker run --rm -it -v ${pwd}:/git alpine/git $allArgs
}

docker pull sweenig/python-3
function python {
  $allArgs = $PsBoundParameters.values + $args
  docker run --rm -it -v ${pwd}:/usr/src/app sweenig:python $allArgs
}

docker pull groovy
function groovy {
  $allArgs = $PsBoundParameters.values + $args
  docker run --rm -it -v ${pwd}:/home/groovy/scripts -w /home/groovy/scripts groovy groovy $allArgs
}
