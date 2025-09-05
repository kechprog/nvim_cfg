return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  ft = "python",
  keys = {
    { "<leader>mp", "<cmd>VenvSelect<cr>", desc = "Select Python Virtual Environment" },
  },
  opts = {
    options = {
      notify_user_on_venv_activation = true,
      activate_venv_in_terminal = true,
      picker = "telescope",
    }
  },
}