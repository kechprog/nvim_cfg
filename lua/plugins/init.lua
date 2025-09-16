-- Plugin manager setup
local lsp_module = require("plugins.lsp")

local plugins = {
  require("plugins.colorscheme"),
  require("plugins.cmp"),
  require("plugins.lazydev"),  -- Add lazydev plugin
  lsp_module.plugin_spec,
  require("plugins.rustaceanvim"),
  require("python"),
  require("plugins.copilot"),
  require("plugins.snacks"),
  require("plugins.treesitter"),
  require("plugins.markview"),
}

-- Setup lazy.nvim with all plugins
require("lazy").setup(plugins, {
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})