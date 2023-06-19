vim.o.number = true

vim.cmd("colorscheme kanagawa")

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "rebelot/kanagawa.nvim"
  use "nvim-lualine/lualine.nvim"
  use "nvim-tree/nvim-tree.lua"
end)

require("lualine").setup()
require("nvim-tree").setup()

