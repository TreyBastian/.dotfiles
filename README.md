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
  - neotest support
- go
  - templ
  - goimports
  - gopls
  - neotest support
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
     - *vue support requires `@vue/typescript-plugin` to be installed globally*
   - volar (vue)
- bash
  - bashls
- docker
  - dockerls
- json
  - prettier
  - jsonls
- COBOL
  - cobol-language-support
- PHP
  - intelephense
  - laravel
  - laravel-blade-nav
  - pint


## Installation Instructions
To install my dotfiles run this command. It will backup any pre-existing dotfiles.

```bash
curl -Lks https://raw.githubusercontent.com/TreyBastian/.dotfiles/master/bootstrap.sh | /bin/bash
```

## TODO
- bootstrap script auto install required software and dependencies
