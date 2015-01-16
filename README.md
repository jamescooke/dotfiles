# Just All My Config Files

Welcome all my configuration files. This is mainly for my own personal use,
although you might find something useful here. My goal is to improve my
development environments that I use on multiple machines. I want to take a cool
bits of config from machine to machine without worrying about how they got
there.

These are notes to myself because I'm very forgetful when it comes to things
that I might use less than once a week or so.


## Set up

This uses python
[chattydotfiles](https://github.com/jamescooke/chattydotfiles).

Info in here soon about how to get chatty to work with this repo.

### Vim setup

The `.vimrc` file uses [Vundle](https://github.com/gmarik/Vundle.vim) and needs
to be wired in when installing from scratch on a clean machine. After doing
`chattydotfiles` for the first time, then:

```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```


## Thanks

Much of this work came from wanting to unify the `.vimrc` files across
different machines. So these thanks are to:

Drew who runs [vim London meetup group](http://www.meetup.com/Vim-London/)
and does [vimcasts](http://vimcasts.org/).

And [Oliver](https://github.com/Wolfy87) for always prodding me to try the new
fun stuff.


## Free

The code in this repository is not licensed in any way.

Do what you want, [Unlicense dot org](http://unlicense.org/), spread the word.
