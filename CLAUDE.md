# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It uses **lazy.nvim** as the plugin manager.

## File Structure

- `init.lua` — single main config file containing options, keymaps, autocommands, and all plugin declarations
- `lua/kickstart/plugins/` — kickstart-provided optional plugins (autopairs, neo-tree, etc.)
- `lua/custom/plugins/` — personal plugin additions; each file returns a lazy.nvim plugin spec

## Plugin Management

Plugins are loaded via `require('lazy').setup(...)` at the bottom of `init.lua`. To add a new plugin:
- Either add it inline in `init.lua`, or
- Create a new file in `lua/custom/plugins/` returning a lazy spec table

Kickstart optional plugins in `lua/kickstart/plugins/` are included by `require 'kickstart.plugins.<name>'` inside the lazy setup call. Custom plugins are auto-imported via `{ import = 'custom.plugins' }`.

## Active Plugins

- **Telescope** — fuzzy finder for files, grep, LSP symbols, buffers
- **nvim-lspconfig + Mason** — LSP with auto-install; active servers: `ts_ls`, `rust_analyzer`, `lua_ls`, `stylua`
- **blink.cmp** — autocompletion (sources: lsp, path, snippets, copilot)
- **copilot.lua + blink-copilot** — GitHub Copilot inline suggestions via blink
- **CopilotChat.nvim** — AI chat in vertical split (70% width)
- **conform.nvim** — format on save; lua uses stylua
- **neo-tree.nvim** — file explorer, follows current file, toggled with `\`
- **toggleterm.nvim** — floating terminal, toggled with `<C-\>` or `<leader>ot`
- **persistence.nvim** — auto-saves/restores sessions; neo-tree is closed before saving
- **mini.nvim** — statusline (`mini.statusline`) and text objects (`mini.ai`)
- **nvim-treesitter** — syntax, highlighting, indentation
- **which-key.nvim** — keymap hints

## Key Keybindings

`<Space>` is the leader key.

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files (Telescope) |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word under cursor |
| `<leader><leader>` | List open buffers |
| `<leader>sn` | Search Neovim config files |
| `<leader>f` | Format buffer (conform) |
| `<leader>ao` | Open CopilotChat |
| `<leader>tc` | Toggle Copilot |
| `<leader>tb` | Toggle git blame |
| `<leader>ot` | Open terminal |
| `<leader>th` | Toggle inlay hints |
| `\` | Toggle Neo-tree |
| `<C-\>` | Toggle floating terminal |
| `K` | LSP hover |
| `grn` | LSP rename |
| `gra` | LSP code action |
| `grr` | LSP references |
| `grd` | LSP go to definition |
| `<M-BS>` | Delete word backward (insert mode) |

## Behavior Notes

- **Autosave** on `InsertLeave` for normal file buffers (notifies LSP of save)
- **Clipboard** synced with OS (`unnamedplus`)
- `c`/`C` motions use the black hole register (don't clobber clipboard)
- Help pages open in a new tab (`wincmd T`)
- LSP hover floats auto-scroll to show cursor at line `L`
- Neo-tree is closed before persistence saves session to avoid restoring it
- `vim.g.have_nerd_font = false` — change to `true` if a Nerd Font is installed

## Updating Plugins

Run `:Lazy update` inside Neovim. The lock file `lazy-lock.json` is tracked in git.
