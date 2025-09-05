# Neovim Configuration Context

## Project Overview

This is a modern Neovim configuration using the `lazy.nvim` plugin manager. The configuration follows a modular structure where each plugin is configured in its own file, including any keymaps specific to that plugin.

### Architecture

- **Entry Point**: `init.lua` - Bootstrap lazy.nvim and load configuration
- **Configuration**: `lua/config/` directory containing:
  - `options.lua` - Basic Neovim settings
  - `keymaps.lua` - Custom key bindings for core Neovim functionality
  - `autocmds.lua` - Automatic commands (currently empty)
- **Plugins**: `lua/plugins/` directory containing plugin configurations:
  - Each plugin file contains both the plugin specification and its keymaps
  - `languages/` subdirectory for language-specific LSP configurations

## Configuration Details

### Core Configuration

#### Options (`lua/config/options.lua`)
- Line numbers enabled (relative numbering)
- Tab settings: 4 spaces for tabs, auto-indentation

#### Keymaps (`lua/config/keymaps.lua`)
Keymaps for core Neovim functionality:
- `jk` to exit insert mode
- Buffer navigation with `H`/`L`
- Basic file operations (`<leader>w` to save, `<leader>q` to close buffer)

### Plugin-Based Keymaps
Each plugin defines its own keymaps within its configuration file:

#### snacks.nvim Picker (replaces Telescope)
- `<leader>ff` - Find files
- `<leader>fa` - Find text in all files
- `<leader>ft` - Find text in current buffer
- `<leader>fs` - Find symbols across all files in project
- `<leader>fS` - Find symbols in current buffer

#### snacks.nvim Explorer (replaces Neo-tree)
- `<leader>e` - Toggle file explorer
- `<leader>E` - Focus file explorer

#### LSP (`lua/plugins/lsp.lua`)
- `gd` - Go to definition
- `gr` - Show references
- `K` - Show hover information
- `<C-k>` - Show signature help
- `<leader>cr` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>cf` - Format code

#### Rustaceanvim (`lua/plugins/rustaceanvim.lua`)
Language-specific keymaps are available under `<leader>m` when editing Rust files:
- `<leader>ma` - Code actions (enhanced for Rust)
- `<leader>mr` - Runnables
- `<leader>md` - Debuggables
- `<leader>mm` - Expand macros
- `<leader>mo` - Move item
- `<leader>mx` - Explain error
- `K` - Hover actions (enhanced for Rust)

#### Python (`lua/python/venv-selector.lua`)
Language-specific keymaps are available under `<leader>m` when editing Python files:
- `<leader>mp` - Select Python virtual environment

#### snacks.nvim LazyGit
- `<leader>gl` - Open LazyGit interface

Note: All language-specific keymaps are buffer-specific and only available when the relevant language file is focused. The `<leader>m` prefix is reserved for language-specific functionality.

## Plugin Management

The configuration uses `lazy.nvim` for plugin management. Plugins are organized as follows:

1. **Colorscheme**: Catppuccin (macchiato flavor)
2. **File Explorer**: snacks.nvim explorer (replaces Neo-tree)
3. **Navigation**: Leap for vim-like motion
4. **Fuzzy Finder**: snacks.nvim picker (replaces Telescope)
5. **Terminal**: snacks.nvim terminal (replaces Toggleterm)
6. **Git Integration**: snacks.nvim lazygit
7. **Syntax Highlighting**: Treesitter for enhanced syntax highlighting
8. **LSP Support**: Full LSP configuration with support for Python and Rust
9. **Autocompletion**: nvim-cmp for code completion
10. **Python Virtual Environments**: venv-selector.nvim for selecting and managing Python virtual environments
11. **AI Assistance**: avante.nvim for AI-powered coding assistance with multiple providers

## Development Conventions

### Adding New Plugins
1. Create a new file in `lua/plugins/` with the plugin configuration and keymaps
2. Add the plugin to the plugins table in `lua/plugins/init.lua`
3. Run `:Lazy sync` to install the plugin

### Adding Language Support
1. For languages other than Python and Rust, add a new file in `lua/plugins/languages/` for the language
2. Configure the LSP in that file
3. Update `lua/plugins/lsp.lua` to load the new language configuration
4. For Python support, modify files in the `lua/python/` directory

## Useful Commands

- `:Lazy` - Open plugin manager
- `:TSUpdate` - Update treesitter parsers
- `:Snacks picker` - Open file picker
- `:Neotree` - Open file explorer
- `:VenvSelect` - Select Python virtual environment (when in a Python file)
- `:AvanteChat` - Open AI chat interface
- `:AvanteAsk` - Ask AI about your code
- `:AvanteBuild` - Build avante.nvim dependencies

## Key Design Principles

1. **Modular Organization**: Each plugin is self-contained in its own file
2. **Local Keymaps**: Plugin-specific keymaps are defined within the plugin configuration
3. **Central Core Configuration**: Basic options and core Neovim keymaps are separate from plugins
4. **Language-Specific LSP Setup**: Each language has its own configuration file in the languages directory (except Python and Rust which have dedicated modules)

## AI Assistance

The configuration includes avante.nvim for AI-powered coding assistance with support for multiple providers:

- **GitHub Copilot** - Default provider for code suggestions
- **Qwen** - Alibaba's Qwen language model
- **Gemini CLI** - Google's Gemini language model

The plugin automatically builds its dependencies when installed or updated. If you encounter issues with the AI features, you can manually trigger a rebuild with `:AvanteBuild`.