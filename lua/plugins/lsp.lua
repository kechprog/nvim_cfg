return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "j-hui/fidget.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      
      -- Setup fidget for LSP progress
      require("fidget").setup({
        progress = {
          display = {
            done_icon = "✓",
            progress_icon = { pattern = "dots", period = 1 },
          },
        },
        notification = {
          window = {
            winblend = 100,
          },
        },
      })
      
      -- LSP attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- Goto definition
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        
        -- Code actions
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        
        -- Goto/show references
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        
        -- Show signature help
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        
        -- Show/toggle hover
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        
        -- Format code
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
      end
      
      -- Enhanced capabilities for autocompletion
      local capabilities = cmp_nvim_lsp.default_capabilities()
      
      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      
      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      
      -- Load language-specific configurations (excluding Rust and Python, which are handled by rustaceanvim and python.nvim)
      -- require("plugins.languages.python").setup(lspconfig, on_attach, capabilities)
    end,
  },
}