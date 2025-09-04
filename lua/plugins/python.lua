return {
  {
    "joshzcold/python.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      "neovim/nvim-lspconfig",
      "nvim-neotest/neotest",
      "nvim-neotest/neotest-python",
    },
    opts = {
      python_lua_snippets = false, -- Disable snippets
    },
    config = function(_, opts)
      require("python").setup(opts)
    end,
  },
}