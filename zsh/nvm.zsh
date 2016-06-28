export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
# retirar o default com o comando abaixo, para o shell abrir mais rápido
# nvm unalias default
# quando for utilizar o node, executar:
# nvm use node
# https://github.com/creationix/nvm/issues/860
# load node and npm only whem used for the first time

if [ ! $(type node >/dev/null) ]
then
  alias node='unalias node npm && nvm use node && node'
  alias npm='unalias node npm && nvm use node && npm'
fi
