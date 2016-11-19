# dar preferência por instalar o node globalmente utilizando brew install yarn,
# pois nvm é lento para carregar
# Executa o setup do nvm apenas se não existir node no path
if [ $(type node >/dev/null) ]
then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm

  # retirar o default com o comando abaixo, para o shell abrir mais rápido
  # nvm unalias default
  # quando for utilizar o node, executar:
  # nvm use node
  # https://github.com/creationix/nvm/issues/860

  alias node='unalias node npm && nvm use node && node'
  alias npm='unalias node npm && nvm use node && npm'
fi
