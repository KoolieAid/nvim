# Neovim configs

### Things I'm not sure how to fix  
1. LSP won't start on lua files, `LspInfo` says the root directory is not set, so idk anymore  

## Suggestions
- Issues and PRs are welcome :)
    - Issue for things that I may figure out myself
    - PRs for things that I cannot figure out on my own. 

## How to use
### Prerequisite 
1. Have `ripgrep` installed for telescope 
2. Have a C compiler installed (i.e. gcc, clang, zig for windows) for tree-sitter
3. Have Node JS v18+ installed for copilot

### Windows
1. Go to `AppData/Local`
2. Clone this repository there.
3. It should create a `nvim` folder in the Local folder.
4. Create a lua file named `secrets.lua` in `lua/config`.

### Linux
1. Go to `~/.config` folder.
2. Clone this repository there.
3. It should create a `nvim` folder in the config folder.
4. Create a lua file named `secrets.lua` in `lua/config`.
