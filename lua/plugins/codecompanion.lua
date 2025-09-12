return {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      strategies = {
          chat = {
            adapter = "o_gpt_oss",
          },
          inline = {
            adapter = "o_gpt_oss",
          },
          cmd = {
            adapter = "o_gpt_oss",
          }
      },
        adapters = {
            acp = {
          gemini_cli = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
                commands = {
                    default = { "gemini", "--experimental-acp" }
                }
            })
          end,
            },
            http = {
                o_qwen3_coder = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "qwen3-coder",
                        opts = {
                            vision = true,
                            stream = true,
                        },
                        schema = {
                            model = {
                                default = "qwen3-coder:latest",
                            },
                            num_ctx = {
                                default = 16384,
                            },
                            think = {
                                default = true,
                            },
                            keep_alive = {
                                default = "15m",
                            },
                        },
                    })
                end,
                o_gpt_oss = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "gpt-oss",
                        opts = {
                            vision = true,
                            stream = true,
                        },
                        schema = {
                            model = {
                                default = "gpt-oss:latest",
                            },
                            num_ctx = {
                                default = 16384,
                            },
                            think = {
                                default = true,
                            },
                            keep_alive = {
                                default = "15m",
                            },
                        },
                    })
                end,
                o_devstral = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "devstral",
                        opts = {
                            vision = false,
                            stream = true,
                        },
                        schema = {
                            model = {
                                default = "devstral:latest",
                            },
                            num_ctx = {
                                default = 16384,
                            },
                            think = {
                                default = true,
                            },
                            keep_alive = {
                                default = "15m",
                            },
                        },
                    })
                end,
            },
        },
    },
    keys = {
      { "<leader>ac", ":CodeCompanionChat<cr>", desc = "Toggle CodeCompanion Chat", silent = true },
        {
            "<leader>ap",
            function()
                local providers = { "copilot", "ollama", "gemini" }
                vim.ui.select(providers, {
                    prompt = "Select AI Provider:",
                    format_item = function(item)
                        return "Provider: " .. item
                    end,
                }, function(provider)
                    if provider == "ollama" then
                        local ollama_models = { "qwen3_coder", "gpt_oss", "devstral" }
                        vim.ui.select(ollama_models, {
                            prompt = "Select Ollama Model:",
                            format_item = function(item)
                                return "Model: " .. item
                            end,
                        }, function(model)
                            if model then
                                local adapter = "o_" .. model
                                require("codecompanion.config").strategies.chat.adapter = adapter
                                require("codecompanion.config").strategies.inline.adapter = adapter
                                require("codecompanion.config").strategies.cmd.adapter = adapter
                                print("CodeCompanion adapter set to: " .. adapter)
                            end
                        end)
                    elseif provider then
                        require("codecompanion.config").strategies.chat.adapter = provider
                        require("codecompanion.config").strategies.inline.adapter = provider
                        require("codecompanion.config").strategies.cmd.adapter = provider
                        print("CodeCompanion adapter set to: " .. provider)
                    end
                end)
            end,
            desc = "Select AI Adapter",
            silent = true
        },
    },
}
