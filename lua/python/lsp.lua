return {
  "neovim/nvim-lspconfig",
  ft = "python",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    
    return {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              }
            }
          }
        }
      }
    }
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    
    -- Enhanced capabilities for autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    -- Setup pyright
    lspconfig.pyright.setup {
      capabilities = capabilities,
      settings = opts.servers.pyright.settings,
    }
  end
}