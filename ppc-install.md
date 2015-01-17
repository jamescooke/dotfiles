# Install PPC Debian

Just some notes to self about installing on PPC.

## Packages

```sh
sudo apt-get install tmux vim git python-pip
sudo pip install virtualenv chattydotfiles
```

## SSH keys and dotfiles

```sh
ssh-keygen
cat .ssh/id_rsa.pub
```

Visit Github key settings and add an ssh key - http://github.com/settings/ssh

```sh
git clone git@github.com:jamescooke/dotfiles.git
chattydotfiles
```

## Coding stuffs

Get some haskell for hacking

```sh
sudo apt-get install ghc
sudo apt-get install haskell-platform haskell-platform-doc
```
