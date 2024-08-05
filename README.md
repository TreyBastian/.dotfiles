# Trey's Dotfiles

These are all of my dotfiles. This works for me, it might not work for you.
I suggest taking these configurations and tweaking them to work for you.

You should also totally watch me live on (Twitch)[https://twitch.tv/trey_bastian]

## Applications You Need
- Ripgrep
- fzf
- Neovim
- tree-sitter
- Alacritty
- git
- zsh
- tmux

### Configured Languages
   
Configuration assumes you have everying required to run these langs.
If you don't edit the conform, lsp, and remove any other plugins associated with
languages you want to remove.

- lua
  - lua-language-server
  - stylua
- java
  - jdtls
  - google-java-format
- go
  - templ
  - goimports
  - gopls
- tailwind
  - prettier
  - tailwindcss-language-server
- html / css
  - prettier
  - emmet_ls
- javascript / typescript
   - prettier
   - eslint
   - tsserver
- bash
  - bashls
- docker
  - dockerls
- json
  - prettier
  - jsonls
- elixir 
  - mix
  - elixir-ls
  - next-ls
  - credo
- COBOL
  - cobol-language-support


## Installation Instructions
To install my dotfiles run this command. It will backup any pre-existing dotfiles.

```bash
curl -Lks https://raw.githubusercontent.com/TreyBastian/.dotfiles/master/bootstrap.sh | /bin/bash
```

## TODO
- bootstrap script auto install required software
