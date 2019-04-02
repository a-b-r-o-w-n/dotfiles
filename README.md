dotfiles
===================

Requirements
------------

Set zsh as your login shell (install if necessary):

    chsh -s $(which zsh)

Install [oh-my-zsh](http://ohmyz.sh/) and the [spaceship prompt](https://github.com/denysdovhan/spaceship-prompt):

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

Install
-------

Clone onto your laptop:

    git clone git://github.com/a-b-r-o-w-n/dotfiles.git

Install:

    bin/setup

Creates symlinks to dotfiles in home directory.
