-- Plugin manager setup
local plugins = {
  require("plugins.colorscheme"),
  require("plugins.neo-tree"),
  require("plugins.leap"),
  require("plugins.cmp"),
  require("plugins.lsp"),
  require("plugins.rustaceanvim"),
  require("python"),
  require("plugins.copilot"),
  require("plugins.avante"),
  require("plugins.snacks"),
  require("plugins.treesitter"),
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
