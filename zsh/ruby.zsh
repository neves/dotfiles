# prefer chruby over rbenv
if [ -f /usr/local/share/chruby/chruby.sh ]
then
  source /usr/local/share/chruby/chruby.sh
  # source /usr/local/share/chruby/auto.sh
  chruby ruby
  [ -f /usr/local/share/gem_home/gem_home.sh ] && source /usr/local/share/gem_home/gem_home.sh
else
  # initialize rbenv (without hehash because it's slow)
  type rbenv >/dev/null 2>&1 && eval "$(rbenv init - --no-rehash)"
fi

# Utilizar https://github.com/postmodern/gem_home
# change gems to dir, useful for trying new gems like rails5
# function chgem() {
#   version=$(chruby | cut -c 9-13)
#   export GEM_HOME=$1/ruby/$version
#   export PATH=$GEM_HOME/bin:$PATH
#   export GEM_PATH=$GEM_HOME:/Users/neves/.rubies/ruby-$version/lib/ruby/gems/2.3.0
# }
