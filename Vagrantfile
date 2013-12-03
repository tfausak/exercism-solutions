Vagrant.configure('2') do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.provision 'shell', inline: <<-'SHELL'
    set -e -v
    update-locale LC_ALL=en_US.UTF-8
    echo > /etc/motd
    aptitude -q -y update
    aptitude -y install haskell-platform
  SHELL

  config.vm.provision 'shell', inline: <<-'SHELL', privileged: false
    set -e -v
    touch .hushlogin
    echo 'PATH="$HOME/.cabal/bin:$PATH"' > .bash_profile
    mkdir -p bin
    wget --no-clobber --quiet github.com/exercism/cli/releases/download/v1.3.1/exercism-linux-amd64.tgz
    test -f exercism-linux-amd64.tar || zcat exercism-linux-amd64.tgz > exercism-linux-amd64.tar
    test -f exercism || tar --extract --file exercism-linux-amd64.tar
    cp --no-clobber exercism bin/exercism
    cabal update
    which hlint || cabal install hlint
    which pointfree || cabal install pointfree
    which pointful || cabal install pointful
    which stylish-haskell || cabal install stylish-haskell
  SHELL
end
