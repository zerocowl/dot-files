# Create a new directory and enter it
mkcd() {
    mkdir -p "$@" && cd "$@"
}

hist() {
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# All the dig info
digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}

# kill all instances of a process by name
skill() {
    sudo kill -9 `ps ax | grep $1 | grep -v grep | awk '{print $1}'`
}

freeport() {
  PORT=$1
  PID=`lsof -ti tcp:$PORT`
  if [ -z "$PID"]; then
    echo "No process running on port $PORT"
  else
    kill -KILL $PID
  fi
}

ipinfo() {
    curl http://ipinfo.io/$1
}

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

set_aws_profile_based_on_dir() {
  if [[ "$PWD" == *"/projects/xxxx"* ]]; then
    export AWS_PROFILE="xxxx"
    export AWS_DEFAULT_REGION=$(aws configure get region --profile xxxx)
  else
    export AWS_PROFILE="default"
    export AWS_DEFAULT_REGION=$(aws configure get region --profile default)
  fi
}
