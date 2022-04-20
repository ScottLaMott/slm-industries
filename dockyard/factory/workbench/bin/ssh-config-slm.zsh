########################################################################################
#
# anlegen und konfigurieren eines benutzer, benutzername später als parameter übergeben
#
#
#

# später als parameter übergeben
user=slm

echo 'add user $(id -nu) ...'
ssh root@192.168.122.240 useradd -m  $user
echo

echo 'set passwd $user ...'
ssh root@192.168.122.240 passwd $user
ssh $user@192.168.122.240 mkdir .ssh
echo

echo 'ssh-copy-id $user ...'
ssh-copy-id -i ~/.ssh/id_rsa.pub $user@192.168.122.240
echo

echo 'scp git-key ...'
scp ~/.ssh/id_rsa.becks  $user@192.168.122.240:.ssh/id_rsa.git.becks
echo

echo 'change shell $user ...'
ssh root@192.168.122.240 chsh -s /usr/bin/zsh $user
echo

echo 'clone dotfiles . . .'
# hole public key von git-server
ssh $user@192.168.122.240 'ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts'
ssh $user@192.168.122.240 'git clone git@github.com:ScottLaMott/dotfiles.git --config core.sshCommand="ssh -i ~/.ssh/id_rsa.git.becks"'
ssh $user@192.168.122.240 'git config --global user.name "Scott LaMott"'
ssh $user@192.168.122.240 'git config --global user.email $(id -nu)@$(hostname)'
echo

echo 'stow $user . . .'
ssh $user@192.168.122.240 'stow -v -t $HOME                -d $HOME/dotfiles vim'

# ~/.config für alle
ssh $user@192.168.122.240 'mkdir  $HOME/.config'

# ranger
ssh $user@192.168.122.240 'mkdir  $HOME/.config/ranger'
ssh $user@192.168.122.240 'stow -v -t $HOME/.config/ranger -d $HOME/dotfiles ranger'

# zsh
ssh $user@192.168.122.240 'stow -v -t $HOME                -d $HOME/dotfiles home'    # .zshenv in HOME-Directory
ssh $user@192.168.122.240 'mkdir  $HOME/.config/zsh'                                  # rest in .config/zsh
ssh $user@192.168.122.240 'stow -v -t $HOME/.config/zsh    -d $HOME/dotfiles zsh'
echo
