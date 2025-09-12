print("Testing CodeCompanion chat functionality...")

-- Try to load and use codecompanion
local status, codecompanion = pcall(require, "codecompanion")
if not status then
  print("Failed to load codecompanion: " .. tostring(codecompanion))
  return
end

print("CodeCompanion loaded successfully")

-- Try to initialize
local status, err = pcall(codecompanion.setup, {
  strategies = {
    chat = {
      adapter = "qwen",
    },
    inline = {
      adapter = "qwen",
    }
  },
  adapters = {
    http = {
      qwen = {
        adapter = "acp",
      },
    },
  },
})

if not status then
  print("Failed to setup codecompanion: " .. tostring(err))
  return
end

print("CodeCompanion setup completed successfully")

-- Try to create a chat
local status, chat = pcall(codecompanion.chat)
if not status then
  print("Failed to create chat: " .. tostring(chat))
  return
end

print("Chat created successfully")