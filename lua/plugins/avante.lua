return {
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- Default provider
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      providers = {
        copilot = {
          model = "gpt-4.1",
        },
      },
      
      -- Disable auto keymaps to use our own
      behaviour = {
        auto_set_keymaps = false,
      },
      
      -- ACP providers configuration
      acp_providers = {
        ["qwen"] = {
          command = "qwen",
          args = { "--experimental-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
          },
        },
        ["gemini"] = {
          command = "gemini",
          args = { "--experimental-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
          },
        },
      },
      
      -- Other options
      hints = { enabled = true },
      windows = {
        width = 50, -- Increased from 30 to 50
        sidebar_open = true,
        preview = {
          layout = "vertical",
          width = 50, -- Increased from 30 to 50
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- Optional dependencies
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      }
    },
    keys = {
      { "<leader>aa", ":AvanteChat<cr>", desc = "Toggle Avante Chat", silent = true },
      { "<leader>ah", ":AvanteHistory<cr>", desc = "Show Avante History", silent = true },
      { "<leader>an", ":AvanteChatNew<cr>", desc = "New Avante Chat", silent = true },
      {
        "<leader>ap",
        function()
          local providers = { "qwen", "copilot", "gemini" }
          vim.ui.select(providers, {
            prompt = "Select AI Provider:",
            format_item = function(item)
              return "Provider: " .. item
            end,
          }, function(choice)
            if choice then
              -- Update the provider
              vim.g.avante_provider = choice
              -- Update the avante configuration properly
              local avante = require("avante")
              if avante then
                avante.setup({ provider = choice })
              end
              print("Avante provider set to: " .. choice)
            end
          end)
        end,
        desc = "Select AI Provider",
        silent = true
      },
    },
  },
}
