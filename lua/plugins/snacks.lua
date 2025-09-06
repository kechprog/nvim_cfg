return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      terminal = {
        enabled = true,
        -- Make terminal a popup
        position = "float",
        width = 0.8,
        height = 0.8,
      },
      picker = {
        enabled = true,
      },
      explorer = {
        enabled = true,
      },
    },
    keys = {
      -- Replace toggleterm's <C-t> with snacks.nvim terminal
      { "<C-t>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
      -- Add lazygit integration
      { "<leader>gl", function() Snacks.lazygit() end, desc = "LazyGit" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "List changed git files" },
      -- Replace telescope keymaps with snacks.nvim picker
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>ft", function() Snacks.picker.lines() end, desc = "Find text in buffer" },
      { "<leader>fa", function() Snacks.picker.grep() end, desc = "Find text in all files" },
      { "<leader>fs", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Find symbols in project" },
      { "<leader>fS", function() Snacks.picker.lsp_document_symbols() end, desc = "Find symbols in current buffer" },
      -- Replace Neo-tree keymaps with snacks.nvim explorer
      { "<leader>e", function() Snacks.explorer() end, desc = "Toggle tree viewer" },
      { "<leader>E", function() Snacks.explorer(vim.fn.expand("%")) end, desc = "Focus tree viewer" },
    },
  },
}
