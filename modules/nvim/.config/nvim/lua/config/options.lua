-- Core settings:
-- font
vim.opt.guifont = "FiraCode Nerd Font:h13"

-- search options
vim.opt.ignorecase = true       -- case-insensitive search
vim.opt.smartcase = true        -- case-sensitive if uppercase present
vim.opt.incsearch = true        -- show matches as you type

-- line options
vim.opt.number = true           -- show absolute numbers
vim.opt.relativenumber = true   -- show relative numbers around cursor

-- wrapping and reading text
vim.opt.wrap = true             -- long lines wrap
vim.opt.linebreak = true        -- wrap at word boundaries
vim.opt.breakindent = true      -- wrapped lines continue indented
vim.opt.background = "dark"     -- colorschemes that can be made light or dark will be made dark
vim.opt.termguicolors = true    -- enable true colors support

-- indentation
vim.cmd('syntax on')            -- syntax highlight
vim.cmd('filetype plugin indent on') --

vim.opt.autoindent = true       -- copy indent from current line
vim.opt.smartindent = true      -- smart-indenting for C-like code
vim.opt.expandtab = true        -- pressing <Tab> inserts spaces instead of tabs

vim.opt.shiftwidth = 4          -- how many columns count as one level of indentation
vim.opt.softtabstop = 4         -- controls how <Tab> and <BS> behave in insert mode
vim.opt.tabstop = 4             -- how wide a literal tab character is displayed

-- cursor context and movement
vim.opt.guicursor = ""          -- cursor look in different modes
vim.opt.cursorline = true       -- highlight current line
vim.opt.scrolloff = 10          -- lines above/below cursor

-- signs, whitespace, and visual helpers
vim.opt.signcolumn = "yes"      -- show signs in number column (used by diagnostics, git signs and breakpoints)
vim.opt.list = true             -- show whitespace characters
vim.opt.listchars = {           -- customize how whitespace characters are shown
  tab = "» ",                       -- tab character
  trail = "·",                      -- trailing spaces
  nbsp = "␣",                       -- non-breaking space
}

-- undo and history
vim.opt.undolevels = 1000       -- number of undo levels
vim.opt.undofile = true         -- persists undo history to disk
vim.opt.undodir = vim.fn.stdpath("data") .. '/undo'

-- buffers and files
vim.opt.autoread = true         -- auto-reload changed file
vim.opt.backup = false          -- create backup files
vim.opt.swapfile = false        -- create swapfile

-- command-line
vim.opt.history = 1000                      -- number of commands kept in command-line history
vim.opt.wildmenu = true                     -- enhances command-line completion
vim.opt.wildmode = "longest:full,full"      -- controls how command-line completion behaves across repeated <TAB> presses
vim.opt.showmode = false                    -- shows current mode in command area (often disabled if statusline shows the current mode)

-- configure how new splits should be opened
vim.opt.splitright = true       -- vertical splits open to the right
vim.opt.splitbelow = true       -- horizontal splits open below

-- timing
vim.opt.timeoutlen = 1000       -- mapping timeout (ms)
vim.opt.updatetime = 250        -- CursorHold delay (ms)

-- misc
vim.opt.title = true            -- display window title in the terminal
