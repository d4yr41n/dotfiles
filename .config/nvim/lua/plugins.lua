require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "rebelot/kanagawa.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            vim.cmd("colorscheme kanagawa")
            require("nvim-web-devicons").setup {}
        end
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function() require("lualine").setup {
            options = { 
                disabled_filetypes = { "NvimTree" }
            }
        } end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("nvim-treesitter.configs").setup {
            highlight = { enable = true }
        } end
    }
    --[[
    use {
        'akinsho/bufferline.nvim',
        requires = "nvim-tree/nvim-web-devicons",
	    config = function() require("bufferline").setup {
            options = {
                offsets = {
                    { filetype = "NvimTree" }
                }
            }
        } end
    }
    use {
        "nvim-tree/nvim-tree.lua",
        requires = "nvim-tree/nvim-web-devicons",
    	config = function() require("nvim-tree").setup() end
    }
    ]]--
    use {
	    "neovim/nvim-lspconfig",
	    requires = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
    	    "L3MON4D3/LuaSnip",
	        "saadparwaiz1/cmp_luasnip"
	    },
        config = function() require("lsp") end
    }
end)

