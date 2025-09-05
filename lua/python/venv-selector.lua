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
    search = {
      -- Miniconda environments in .miniconda3 directory
      miniconda3 = {
        command = "fd bin/python$ ~/.miniconda3/envs --full-path --color never",
        type = "anaconda"
      },
    },
    options = {
      notify_user_on_venv_activation = true,
      activate_venv_in_terminal = true,
      picker = "telescope",
    }
  },
}