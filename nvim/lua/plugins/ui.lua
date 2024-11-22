return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- Default options:
			require('kanagawa').setup({
			    compile = true,             -- enable compiling the colorscheme
			    undercurl = true,            -- enable undercurls
			    commentStyle = { italic = true },
			    functionStyle = {},
			    keywordStyle = { italic = true},
			    statementStyle = { bold = true },
			    typeStyle = {},
			    transparent = false,         -- do not set background color
			    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
			    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
			    colors = {                   -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			    },
			    overrides = function(colors) -- add/modify highlights
				return {}
			    end,
			    theme = "wave",              -- Load "wave" theme when 'background' option is not set
			    background = {               -- map the value of 'background' option to a theme
				dark = "wave",           -- try "dragon" !
				light = "lotus"
			    },
			})

			-- setup must be called before loading
			vim.cmd("colorscheme kanagawa")	
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
        config = function()
            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({
                sync_install = true,
                auto_install = true,
                highlight = {
                    enable = true,
                }
            })
        end
	}
}
