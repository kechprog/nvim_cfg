return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<esc>"] = actions.close,
            },
            n = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["q"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            additional_args = function(opts)
              return {"--hidden"}
            end
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })
      
      -- Load fzf extension
      telescope.load_extension("fzf")
      
      -- Telescope keymaps
      local builtin = require("telescope.builtin")
      
      -- Find files
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      
      -- Find text in current buffer
      vim.keymap.set("n", "<leader>ft", builtin.current_buffer_fuzzy_find, { desc = "Find text in buffer" })
      
      -- Find text in all files (live grep)
      vim.keymap.set("n", "<leader>fa", builtin.live_grep, { desc = "Find text in all files" })
      
      -- Find symbols across all files in project
      vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, { desc = "Find symbols in project" })
      
      -- Find symbols in current buffer using Treesitter
      vim.keymap.set("n", "<leader>fS", builtin.treesitter, { desc = "Find symbols in current buffer" })
    end,
  },
}
