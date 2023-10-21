# Let's set up the gorgodon

You got a new macos in your hand and have to get it up and running like a champ? Let's get it going....

### Step 1
Make sure to get ready all your secrets like passwords and ssh keys if you want to load them to this machine. 

### Step 2
- Download the [`init.sh` script](https://github.com/samuherek/dev.macos-setup/blob/main/init.sh)
- Make it executable `chmod +x ${path to the init.sh}`
- Run the beast!

*NOTE:*
In case I ever get this repo public, we can make a more straightforward execution.

> All this script does is it installs homebrew, ansible, and sets up ssh keys to get the ball rolling...

### Step 3
Run the ansible palybooks....

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




todo:
[ ] install brew
- instal developer studd xcode
- sett settings
  - mouse speed -> should be done?
  - scroll direction -> should be done?
  - key repeat -> should be done?
  - dock -> should be done?
  - menu -> should be done?
  - hot corners -> should be done?
  - spaces with keyboard shortcut -> should be done?
  - show dot files in finder by default -> should be done?
  - make sure that when clicking on mainto it doesn't open mail app by default -> should be done?
- disable spotlight -> should be done?
- disable siri -> should be done?
- disable spotlight indexing -> should be done?

[ ] software update macos and other internal tools. 'softwareupdate' 'sudo softwareupdate -i -a'

- 
 
- install apps
  - setapp
  - brave brower
  - google chrome
  - firefox
  - 

- dotfiles
  - zsh
  - aliases
  - functions
  - scripts
 
- config
  - vim
  - zsh
  - tmux
  - skhd
  - yabai
  - hammerspoon
  - ssh keys
 


TODO:
- disable the function key or configure it in some way (settings -> keyboard -> press fn key to:)
- Programatically switch the caps lock key to escape key
