local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
    "nvim-tree/nvim-web-devicons",
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = "doom",
                config = {
                    header = {
                        [[]],
                        [[]],
                        [[]],
                        [[=================     ===============     ===============   ========  ========]],
                        [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
                        [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
                        [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
                        [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
                        [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
                        [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
                        [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
                        [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
                        [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
                        [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
                        [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
                        [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
                        [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
                        [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
                        [[||.=='    _-'                                                     `' |  /==.||]],
                        [[=='    _-'                                                            \/   `==]],
                        [[\   _-'                                                                `-_   /]]
                    },
                    center = {
                        {
                            desc = "tree",
                            key = "t",
                            action = "NvimTreeOpen"
                        },
                        {
                            desc = "exit",
                            key = "q",
                            action = "q"
                        }
                    },
                    footer = {
                        "Nothing but pain"
                    }
                }
            }
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup {
                symbols = {
                    Class = { icon = "󰏗", hl = "@type" }
                }
            }
        end
    },
    {
        "bluz71/vim-moonfly-colors",
        config = function()
            vim.cmd("colorscheme moonfly")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function() require("lualine").setup {
            options = { 
                icons_enabled = false,
                disabled_filetypes = { "NvimTree" }
            }
        } end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("nvim-treesitter.configs").setup {
            highlight = { enable = true }
        } end
    },
    {
        'akinsho/bufferline.nvim',
	    config = function() require("bufferline").setup {
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        highlight = "Directory",
                        separator = true
                    }
                },
            }
        } end
    },
    {
        "nvim-tree/nvim-tree.lua",
    	config = function() require("nvim-tree").setup() end
    },
    {
	    "neovim/nvim-lspconfig",
	    dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
    	    "L3MON4D3/LuaSnip",
	        "saadparwaiz1/cmp_luasnip"
	    },
        config = function() require("lsp") end
    }
})

