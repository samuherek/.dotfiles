# Let's set up the gorgodon

You got a new macos in your hand and have to get it up and running like a champ? Let's get it going....

### Step 1
Make sure to get ready all your secrets like passwords and ssh keys if you want to load them to this machine. 

### Step 2

## What this is about 

This repository is the root of all evil. It serves as a way to get my macos computer up to speed for development purposes. Which is every macocs computer I will most likely own :D. 

1. Install xcode command line tools
2. Install homebrew
3. Install homebrew formulas
4. Install homebrew casks
5. Start skhd
6. Start yabai
7. Apply general OS defaults
8. Apply app specific defaults
9. Stow .dotfiles
10. Create general folder structure
11. Import ssh keys
12. Open apps that need to be configured
13. Ask to update apps and the operating system
14. 

[ ] software update macos and other internal tools. 'softwareupdate' 'sudo softwareupdate -i -a'

TODO:
[ ] make a small interactive CLI that will treplace the "init" for easy refresh of installs like homebrew formulas. 


- Programatically switch the caps lock key to escape key

- the reduce notion does not apply
- the space hotkeys doen't apply
- reduce transparency does not apply
- there are some errors when applying defaults
- abstract the stow folders so we can easily run clean env and init on stow with only one set of values
- Install the kinesis software so I can update keyboard if necessary. But only for the development machines not a laptop? https://kinesis-ergo.com/support/kb360/#smartset-app
- `git config --global user.email "email@email.com"` -> streemline config
- `git config --global user.name "your name"` -> streemline config
- install rust `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- install nvm with `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash` and install latest node. We'll always need node for now.
- Make a small script which is `so` that will do `source .zshrc`
- add a keyboard shortcut for moving certain windows to different monitors

###`.ssh`
Make sure to
```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/my_custom_key
```
and here is a template for the ssh config:
```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/my_custom_key
```
