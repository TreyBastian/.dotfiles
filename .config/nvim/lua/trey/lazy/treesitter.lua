return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "windwp/nvim-ts-autotag",
    "HiPhish/rainbow-delimiters.nvim",
  },
  main = "nvim-treesitter.configs",
  build = ":TSUpdate",
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
    },
  },
  config = true,
}
