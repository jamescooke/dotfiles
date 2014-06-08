# Just All My Config Files

Welcome all my configuration files. This is mainly for my own personal use,
although you might find something useful here. My goal is to improve my
development environments that I use on multiple machines. I want to take a cool
bits of config from machine to machine without worrying about how they got
there.

These are notes to myself because I'm very forgetful when it comes to things
that I might use less than once a week or so.


## Set up

This uses python [dotfiles](https://github.com/jbernard/dotfiles).

    sudo pip install dotfiles
    git clone git@github.com/jamescooke/dotfiles

There is a `.dotfilesrc` in the repository itself so there is a touch of
patching to get it to work first time. Do a dry run first to see what'll be
overridden and changed.

    dotfiles --config=dotfiles/dotfilesrc --sync --dry-run

If happy then run full thing:

    dotfiles --config=dotfiles/dotfilesrc --sync

This patches in the dot files plus sets `dotfiles` to run from the its config
file which it tracks itself.


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
