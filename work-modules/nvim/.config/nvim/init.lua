-- Leader keys must be set before any keymaps or plugins define mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core settings
require('config.options')

-- Custom filetypes
require('config.filetypes')

-- Custom :Commands
require('config.commands')

-- Event-based behavior
require('config.autocommands')

-- General keymaps not owned by plugins
require('config.keymaps')

-- This work profile deliberately does not load a plugin manager. In particular,
-- do not bootstrap lazy.nvim on managed machines. This safely returns when
-- Lazy has not been installed by `work-install --plugins`.
require('config.lazy')
