# My neovim configs

The plugins I use are referenced as submodules here.

I'm not sure if this approach will prove useful, but so far it seems a bit simpler than managing
initial cloning manually. Yep, I don't use A plugin manager: built-in capabilities seem to be quite
enough for now.

Colorscheme colors/dgrin-fullcolor.vim is (or was) written by me from scratch. If you happen to
like it, you're free to use it with or without credit - it's just colorcodes after all. But please
don't claim, I've stolen it from you :-)

The colorshceme is still very far from being complete. If I ever think dgrin (it was a 256-color
scheme once, hence the fullcolor suffix here) is finished, I'll probably move it to a separate repo.

TODO: write myself a reminder on how to actually init this stuff on a new workstation.
Probably `git clone --recursive` should be enough, though.

## Extra software that should be installed separately

- [fzy - A better fuzzy finder](https://github.com/jhawthorn/fzy)
- [ripgrep - recursively searches directories for a regex pattern](https://github.com/BurntSushi/ripgrep)
