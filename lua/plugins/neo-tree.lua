return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            with_expanders = nil,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
          },
        },
        window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          group_empty_dirs = false,
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = false,
        },
      })
      
      -- Neo-tree specific keymaps
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle tree viewer" })
      vim.keymap.set("n", "<leader>E", "<cmd>Neotree focus<CR>", { desc = "Focus tree viewer" })
    end,
  },
}