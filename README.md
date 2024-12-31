# Trey's Dotfiles

These are all of my dotfiles. This works for me, it might not work for you.
I suggest taking these configurations and tweaking them to work for you.

You should also totally watch me live on [Twitch](https://twitch.tv/trey_bastian)

## Applications You Need
- Ripgrep
- fzf
- Neovim
- tree-sitter
- ghostty 
- git
- zsh
- oh-my-zsh

### Configured Languages
   
Configuration only loads languages that are installed on the system. So should work out of the box.

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
   - svelte
   - astro
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
- Fortran
  - fortran-language-server
  - findent (formatter)
- Ocaml
    - ocaml-lsp
    - ocamlformat
- Godot (gdscript)
    - some setup required see [instructions](https://www.reddit.com/r/neovim/comments/1c2bhcs/godotgdscript_in_neovim_with_lsp_and_debugging_in/)

## Installation Instructions
To install my dotfiles run this command. It will backup any pre-existing dotfiles.

```bash
curl -Lks https://raw.githubusercontent.com/TreyBastian/.dotfiles/main/bootstrap.sh | /bin/bash
```

## TODO
- bootstrap script auto install required software and dependencies
