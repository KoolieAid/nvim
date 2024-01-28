# Neovim configs

## Origin
~~Config is derived from ThePrimeagen's 0 - LSP Neovim setup~~ 
Changes include the LSP part of the video as Mason updated to a new paradigm, so I had to manually figure out how to do it.  
Another change is the custom keybindings, I did not include everything, only the useful ones as I want to learn Vim the way it is first before changing the keybinds.

### Update 
Since I found out that packer.nvim is deprecated, I switched to lazy.nvim, propmting me to make my own config  
However, other complex stuff such as LSPs, Completions, Linting and Formatting are derived from typecraft's Neovim series.  

### Things I'm not sure how to fix  
1. Discord Presence not working anymore, unsure how to setup the lazy loading for this one, packer version seems to work fine  
2. LSP won't start on lua files, `LspInfo` says the root directory is not set, so idk anymore  

## Suggestions
- Issues and PRs are welcome :)
    - Issue for things that I may figure out myself
    - PRs for things that I cannot figure out on my own. 

## How to use
### Prerequisite 
1. Have `ripgrep` installed for telescope 
2. Have a C compiler installed (i.e. gcc, clang) for telescope

### Windows
1. Go to `AppData/Local`
2. Clone this repository there.
3. It should create a `nvim` folder in the Local folder.

### Linux
1. Go to `~/.config` folder.
2. Clone this repository there.
3. It should create a `nvim` folder in the config folder.
