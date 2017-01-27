# Just All My Config Files

Welcome all my configuration files. This is mainly for my own personal use,
although you might find something useful here. My goal is to improve my
development environments that I use on multiple machines. I want to take a cool
bits of config from machine to machine without worrying about how they got
there.

These are notes to myself because I'm very forgetful when it comes to things
that I might use less than once a ~~week~~ month or so.


## Set up

I'm using GNU `stow` to manage links to dotfiles.

    $ sudo apt-get install stow
    $ git clone git@github.com:jamescooke/dotfiles.git
    $ cd dotfiles
    $ stow -t ~ store


### Vim setup

Vim is configured to use [Plug](https://github.com/junegunn/vim-plug). After
doing `chattydotfiles` for the first time:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

You can find out more about [my Vim configuration in this
post](http://jamescooke.info/my-vim-setup-for-python-development.html), mainly
for working with Python.


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
