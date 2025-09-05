-- Python support module
local M = {}

-- Require and return all Python-related plugins
M.plugins = {
  require("python.venv-selector"),
  require("python.lsp"),
}

return M.plugins