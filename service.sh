#!/bin/bash

verificar_servico() {
  if ! docker ps -a | grep -q "$1"; then
    echo "Serviço '$1' não encontrado."
    exit 1
  fi
}

criar_servico_da_imagem() {
  docker run -d --name "$1" "$2"
  echo "Serviço '$1' criado a partir da imagem '$2'."
}

criar_servico_do_dockerfile() {
  cd ./"$1" || { echo "Erro ao acessar diretório '$1'"; exit 1; }
  docker build -t "$1" .
  echo "Serviço '$1' criado a partir do Dockerfile."
}

executar_servico() {
  case "$1" in
    dns)
      docker run -d -p 53:53/tcp -p 53:53/udp --name "$1" "$1"
      echo "Serviço 'dns' está rodando."
      ;;
    web)
      docker run -d -p 80:80 --name "$1" "$1"
      echo "Serviço 'web' está rodando."
      ;;
    *)
      echo "Não existe uma imagem com o nome '$1'."
      echo "Tente utilizar 'dns' ou 'web'."
      exit 1
      ;;
  esac
}

iniciar_servico() {
  verificar_servico "$1"
  docker start "$1"
  echo "Serviço '$1' iniciado."
}

parar_servico() {
  verificar_servico "$1"
  docker stop "$1"
  echo "Serviço '$1' parado."
}

remover_servico() {
  verificar_servico "$1"
  docker rm -f "$1"
  echo "Serviço '$1' excluído."
}

if [ $# -lt 2 ]; then
  echo "Uso incorreto. Você deve fornecer o nome do serviço e a ação (criar, iniciar, parar, remover, executar)."
  exit 1
fi

case "$2" in
  criar)
    if [ $# -ne 3 ]; then
      echo "Uso: $0 <serviço> criar <imagem/Dockerfile>"
      echo "Exemplo: $0 web criar nginx:latest"
      exit 1
    fi
    
    if [[ -f ./$1/Dockerfile ]]; then
      criar_servico_do_dockerfile "$1"
    else
      criar_servico_da_imagem "$1" "$3"
    fi
    ;;
  
  start)
    start_service "$1"
    ;;
  
  stop)
    stop_service "$1"
    ;;
  
  remove)
    remove_service "$1"
    ;;
  
  run)
    run_service "$1"
    ;;
  
  *)
    echo "Ação inválida. Use 'create', 'start', 'stop', 'run' ou 'remove'."
    exit 1
    ;;
esac
