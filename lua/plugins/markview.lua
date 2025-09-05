return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49,
    ft = {"md", "Avante"},
    config = function()
        local markview = require("markview")
        markview.setup({
            experimental = {
                check_rtp = false
            },
            preview = {
                filetypes = {
                    'md',
                    'markdown',
                    'Avante',
                },
                ignore_buftypes = {},
            }
        })
    end
  }
}
