vim.opt.number = true

vim.cmd("colorscheme kanagawa")

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "rebelot/kanagawa.nvim"
  use "nvim-lualine/lualine.nvim"
  use "nvim-tree/nvim-tree.lua"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = {"nvim-lua/plenary.nvim"}
  }
end)

require("lualine").setup()
require("nvim-tree").setup()
require("telescope").setup()

local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = cmp.mapping.confirm { select = true }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = 'luasnip' }
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  }
}

require("lspconfig").pyright.setup {
  capabilities = require("cmp_nvim_lsp").default_capabilities()
}

