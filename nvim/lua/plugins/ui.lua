return {
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		-- Default options:
	-- 		require('kanagawa').setup({
	-- 		    compile = true,             -- enable compiling the colorscheme
	-- 		    undercurl = true,            -- enable undercurls
	-- 		    commentStyle = { italic = true },
	-- 		    functionStyle = {},
	-- 		    keywordStyle = { italic = true},
	-- 		    statementStyle = { bold = true },
	-- 		    typeStyle = {},
	-- 		    transparent = false,         -- do not set background color
	-- 		    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
	-- 		    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
	-- 		    colors = {                   -- add/modify theme and palette colors
	-- 			palette = {},
	-- 			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- 		    },
	-- 		    overrides = function(colors) -- add/modify highlights
	-- 			return {}
	-- 		    end,
	-- 		    theme = "wave",              -- Load "wave" theme when 'background' option is not set
	-- 		    background = {               -- map the value of 'background' option to a theme
	-- 			dark = "wave",           -- try "dragon" !
	-- 			light = "lotus"
	-- 		    },
	-- 		})
	--
	-- 		-- setup must be called before loading
	-- 		-- vim.cmd("colorscheme kanagawa")	
	-- 	end
	-- },
	--    {
	--        "folke/tokyonight.nvim",
	--        config = function()
	--            -- vim.cmd("colorscheme tokyonight-night")
	--        end
	--    },
    -- {
    --     "UtkarshVerma/molokai.nvim",
    --     config = function()
    --         vim.cmd("colorscheme molokai")
    --     end
    -- },
    -- {
    --     "loctvl842/monokai-pro.nvim",
    --     config = function()
    --         local monokai = require("monokai-pro")
    --         monokai.setup()
    --
    --         vim.cmd("colorscheme monokai-pro")
    --     end
    -- },
    {
        "tanvirtin/monokai.nvim",
        config = function()
            vim.cmd("colorscheme monokai")
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
                },
            })
        end
	},
    {
        "onsails/lspkind.nvim",
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
              options = {
                icons_enabled = true,
                theme = 'auto',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {}
              },
              sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { {
                  'filename',
                  file_status = true, -- displays file status (readonly status, modified status)
                  path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
                } },
                lualine_x = {
                  { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
                    hint = ' ' } },
                  'encoding',
                  'filetype'
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
              },
              inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { {
                  'filename',
                  file_status = true, -- displays file status (readonly status, modified status)
                  path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
                } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
              },
              tabline = {},
              extensions = { 'fugitive' }
            })
        end
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup({
                options = {
                    -- mode = "tabs",
                    separator_style = "slant",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true
                }
            })

            vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
            vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
            vim.keymap.set('n', 'bx', '<Cmd>bd<CR>')
        end
    },
    {
        "nvim-tree/nvim-web-devicons"
    }
}
