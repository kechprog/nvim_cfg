return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      -- Rustaceanvim configuration
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
          -- ...
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- Integrate with existing LSP keymaps by reusing the same keybindings
            -- These keymaps will use rustaceanvim's enhanced functionality when available
            -- but fall back to standard LSP when not
            
            -- Code actions (enhanced by rustaceanvim)
            vim.keymap.set("n", "<leader>ma", function()
              vim.cmd.RustLsp('codeAction')
            end, { buffer = bufnr, desc = "Code Action (Rust)" })
            
            -- Hover actions (enhanced by rustaceanvim)
            vim.keymap.set("n", "K", function()
              vim.cmd.RustLsp({'hover', 'actions'})
            end, { buffer = bufnr, desc = "Hover (Rust)" })
            
            -- Runnables
            vim.keymap.set("n", "<leader>mr", function()
              vim.cmd.RustLsp('runnables')
            end, { buffer = bufnr, desc = "Runnables" })
            
            -- Debuggables
            vim.keymap.set("n", "<leader>md", function()
              vim.cmd.RustLsp('debuggables')
            end, { buffer = bufnr, desc = "Debuggables" })
            
            -- Expand macros
            vim.keymap.set("n", "<leader>mm", function()
              vim.cmd.RustLsp('expandMacro')
            end, { buffer = bufnr, desc = "Expand Macro" })
            
            -- Move item
            vim.keymap.set("n", "<leader>mo", function()
              vim.cmd.RustLsp('moveItem')
            end, { buffer = bufnr, desc = "Move Item" })
            
            -- Explain error
            vim.keymap.set("n", "<leader>mx", function()
              vim.cmd.RustLsp('explainError')
            end, { buffer = bufnr, desc = "Explain Error" })
          end,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
              procMacro = {
                enable = true,
              },
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },
            },
          },
        },
        -- DAP configuration
        dap = {
          -- ...
        },
      }
    end,
  },
}