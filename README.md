# Trey's Dotfiles

These are all of my dotfiles. This works for me, it might not work for you.
I suggest taking these configurations and tweaking them to work for you.

You should also totally watch me live on [Twitch](https://twitch.tv/trey_bastian)

## Applications You Need
- Ripgrep
- fzf
- Neovim
- tree-sitter
- Wezterm 
- git
- zsh
- nvm
- sdkman
- rbenv

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
  - html-lsp
  - css-lsp
- javascript / typescript
   - prettier
   - eslint
   - ts_ls
     - *vue support requires `@vue/typescript-plugin` to be installed globally*
   - volar (vue)
   - svelte
   - neotest support (jest and vitest) 
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
  - laravel (version pinned need to fix breaking changes)
  - laravel-blade-nav
  - pint
  - neotest support (pest)
- Ruby
  - ruby_lsp
  - rubocop
  - erb_formatter
  - neotest support (rspec)


## Installation Instructions
To install my dotfiles run this command. It will backup any pre-existing dotfiles.

```bash
curl -Lks https://raw.githubusercontent.com/TreyBastian/.dotfiles/main/bootstrap.sh | /bin/bash
```

## TODO
- bootstrap script auto install required software and dependencies

## Acknowledgements
This configuration takes various inspiration from:
- [ThePrimagen](https://github.com/theprimeagen) - Vim
- [Jess Archer](https://github.com/jessarcher) - PHP and Vue
