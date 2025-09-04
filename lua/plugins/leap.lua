return {
  {
    "ggandor/leap.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "tpope/vim-repeat",
    },
    config = function()
      local leap = require("leap")
      
      -- Configure leap options
      leap.opts.highlight_unlabeled_phase_one_targets = true
      leap.opts.safe_labels = {}
      leap.opts.labels = "asdghklqwertyuiopzxcvbnmfj"
      leap.opts.max_highlighted_traversal_targets = 10
      leap.opts.case_sensitive = false
      leap.opts.max_phase_one_targets = 0
      
      -- Use vim.keymap.set for custom mappings to f/F
      vim.keymap.set({"n", "x", "o"}, "f", function()
        leap.leap({ target_windows = { vim.fn.win_getid() } })
      end, { desc = "Leap forward in window" })
      
      -- Define highlight colors
      vim.api.nvim_set_hl(0, "LeapMatch", { link = "IncSearch" })
      vim.api.nvim_set_hl(0, "LeapLabelPrimary", { link = "WarningMsg" })
      vim.api.nvim_set_hl(0, "LeapLabelSecondary", { link = "StatusLine" })
    end,
  },
}
