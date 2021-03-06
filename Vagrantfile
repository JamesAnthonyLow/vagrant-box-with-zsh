Vagrant.configure(2) do |config|
  config.vm.define "workstation" do |w|
    w.vm.box = "ubuntu/trusty64"
    w.vm.network "forwarded_port", guest: 8080, host: 8080
    w.vm.network "forwarded_port", guest: 3000, host: 3000
    w.vm.network "forwarded_port", guest: 3001, host: 3001
    w.vm.network "private_network", type: "dhcp"

    #Install git and zsh prerequisites 
    config.vm.provision :shell, inline: "apt-get -y install git"
    config.vm.provision :shell, inline: "apt-get -y install zsh"

    # Clone Oh My Zsh from the git repo
    config.vm.provision :shell, privileged: false,
      inline: "git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"

    # Copy in the default .zshrc config file
    config.vm.provision :shell, privileged: false,
      inline: "cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc"

    # Change the vagrant user's shell to use zsh
    config.vm.provision :shell, inline: "chsh -s /bin/zsh vagrant"

    # Make sure vim is installed
    config.vm.provision :shell, inline: "apt-get -y install vim"

    # Clone vundle from the git repo 
    config.vm.provision :shell, privileged: false,
      inline: "git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"

    # Copy in the default .vimrc config file
    config.vm.provision :shell, privileged: false,
      inline: "cp /vagrant/vimrc ~/.vimrc"

    # Install Openssl
    config.vm.provision :shell, inline: "apt-get -y install libssl-dev"

    # Install plugins
    config.vm.provision :shell, privileged: false,
      inline: "vim +PluginInstall &> /dev/null"

    # Install tmux
    config.vm.provision :shell, inline: "apt-get -y install tmux"
  end
end
