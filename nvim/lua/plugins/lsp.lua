return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
            local lspformat = require("lsp-format")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_list = { "gopls" }

            lspformat.setup()

			for _, v in ipairs(lsp_list) do
				lspconfig[v].setup({
                    on_attach = lspformat.on_attach,
					capabilities = capabilities,
				})
			end
		end
	},
    {
        "lukas-reineke/lsp-format.nvim",
    },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
                window = {
                  completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered(),
                },
              formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                  local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                  local strings = vim.split(kind.kind, "%s", { trimempty = true })
                  kind.kind = " " .. (strings[1] or "") .. " "
                  kind.menu = "    (" .. (strings[2] or "") .. ")"

                  return kind
                end,
              },
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, { name = "buffer" })
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }
				}
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" }
				}, {
					{ name = "cmdline" }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"hrsh7th/cmp-cmdline",
	},
    {
        "nvimdev/lspsaga.nvim",
        lazy = false,
        config = function()
            local saga = require("lspsaga")
            saga.setup({
                lightbulb = {
                    enable = false
                }
            })

            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
            vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
            vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
            vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga incoming_calls<CR>', opts)
            vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
            vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
        end
    }
}
