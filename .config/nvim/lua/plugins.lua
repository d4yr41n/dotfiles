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
    {
        "daschw/leaf.nvim",
        config = function()
            require("leaf").setup {
                contrast = "high"
            }
            vim.cmd("colorscheme leaf")
        end
    },
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
                        [[\   _-'                                                                `-_   /]],
                        [[]],
                        [[]],
                        [[]]
                    },
                    center = {
                        {
                            desc = "new",
                            key = "n",
                            action = "tabnew"
                        },
                        {
                            desc = "tree",
                            key = "t",
                            action = "e ~/"
                        },
                        {
                            desc = "quit",
                            key = "q",
                            action = "q"
                        }
                    },
                    footer = {
                        "",
                        "",
                        "",
                        "Nothing but pain",
                        "",
                        "",
                        ""
                    }
                }
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("nvim-treesitter.configs").setup {
            highlight = { enable = true }
        } end
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

