local M = {}

function M.setup(lspconfig, on_attach, capabilities)
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
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
  })
end

return M