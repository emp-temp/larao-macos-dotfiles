return {
    {
        "kenn7/vim-arsync",
    },
    {
        "prabirshrestha/async.vim",
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require('telescope.actions')


            local function telescope_buffer_dir()
                  return vim.fn.expand('%:p:h')
            end

            local fb_actions = require "telescope".extensions.file_browser.actions

            vim.keymap.set("n", ";f", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", ";r", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "\\\\", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", ";t", builtin.help_tags, { desc = "Telescope help tags" })

            local telescope = require("telescope")
            telescope.setup {
              defaults = {
                mappings = {
                  n = {
                    ["q"] = actions.close
                  },
                },
              },
              extensions = {
                file_browser = {
                  theme = "dropdown",
                  -- disables netrw and use telescope-file-browser in its place
                  hijack_netrw = true,
                  mappings = {
                    -- your custom insert mode mappings
                    ["i"] = {
                      ["<C-w>"] = function() vim.cmd('normal vbd') end,
                    },
                    ["n"] = {
                      -- your custom normal mode mappings
                      ["N"] = fb_actions.create,
                      ["h"] = fb_actions.goto_parent_dir,
                      ["/"] = function()
                        vim.cmd('startinsert')
                      end
                    },
                  },
                },
              },
            }
            telescope.load_extension("file_browser")

            vim.keymap.set("n", "sf", function()
              telescope.extensions.file_browser.file_browser({
                path = "%:p:h",
                cwd = telescope_buffer_dir(),
                respect_gitignore = false,
                hidden = true,
                grouped = true,
                previewer = false,
                initial_mode = "normal",
                layout_config = { height = 40 }
              })
            end)

            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Telescope lsp_definitions" })
            vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "Telescope lsp_type_definitions" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Telescope lsp_implementations" })
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            local autotag = require("nvim-ts-autotag")
            autotag.setup()
        end
    }
}
