return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
		    -- vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme "moonfly"
		end,
	},
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme "nightfly"
        end,
    },
	{
		"nyoom-engineering/oxocarbon.nvim",
		name = "oxocarbon",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme "oxocarbon"
		end,
	},
	{
		"polirritmico/monokai-nightasty.nvim",
        name="monokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("monokai-nightasty")
		end,
	},
    {
        "loctvl842/monokai-pro.nvim",
        name="monokai-pro",
        lazy = false,
        priority = 1000,
        config = function()
            require("monokai-pro").setup()
            vim.cmd.colorscheme("monokai-pro-classic")
        end,
    },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				undercurl = false,
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
			})
            -- vim.cmd.colorscheme "kanagawa"
		end,
	},
    {
        "ellisonleao/gruvbox.nvim",
        name="gruvbox",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme = "gruvbox"
        end,
    },
    {
        "sainnhe/everforest",
        name="everforest",
        lazy = false,
        priority = 1000,
        config = function()

        end,
    },
    {
        "sainnhe/sonokai",
        name="sonokai",
        lazy = false,
        priority = 1000,
        config = function()

        end,
    },
    {
        "sainnhe/edge",
        name="edge",
        lazy = false,
        priority = 1000,
        config = function()

        end,
    }
}


