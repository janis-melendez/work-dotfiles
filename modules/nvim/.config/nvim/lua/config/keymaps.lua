-- General keymaps not owned by plugins
local function opts(desc)
    return {
        noremap = true,
        desc = desc,
    }
end

local function toggle_quickfix()
    local winid = vim.fn.getqflist({ winid = 0 }).windid

    if winid ~= 0 then
        vim.cmd.cclose()
    else
        vim.cmd.copen()
    end
end

-- File actions
vim.keymap.set('n', '<leader><leader>', '<cmd>w<cr>', opts('Write to file'))
vim.keymap.set('n', '<C-q>', '<cmd>q<cr>', opts('Quit nvim'))

-- Navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts('Move half-page down'))
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts('Move half-page up'))

-- Quickfix
vim.keymap.set('n', '<M-j>', "<cmd>cnext<cr>", opts('Next quickfix item'))
vim.keymap.set('n', '<M-k>', "<cmd>cprev<cr>", opts('Previous quickfix item'))

vim.keymap.set('n', '<leader>co', '<cmd>copen<cr>', opts('Open quickfix'))
vim.keymap.set('n', '<leader>cn', "<cmd>cnext<cr>", opts('Next quickfix item'))
vim.keymap.set('n', '<leader>cp', "<cmd>cprev<cr>", opts('Previous quickfix item'))
vim.keymap.set('n', '<leader>cq', toggle_quickfix, opts('Toggle quickfix list'))

-- Search
vim.keymap.set('n', '<leader>cl', '<cmd>ClearSearch<cr>', opts('Clear highlighted search'))

-- Yank behavior
vim.keymap.set('n', 'Y', 'y$', opts('Yank to end of line'))

-- Delete / paste behavior
vim.keymap.set("v", "<leader>d", '"_d', opts("Delete selection without yanking it"))
vim.keymap.set('v', '<leader>p', '"_dp', opts('Delete current selection, yank into void register (to avoid replacing prev yank)'))

-- System clipboard
vim.keymap.set({ 'n', 'v'}, '<leader>y', '"+y', opts('Yank into system clipboard'))
vim.keymap.set('n', '<leader>p', '<cmd>put +<cr>', opts('Paste from system keyboard below'))
vim.keymap.set('n', '<leader>P', '<cmd>-1put +<cr>', opts('Paste from system keyboard above'))

-- Entire file actions
vim.keymap.set('n', '<leader>=', 'gg=G', opts('Indent entire file'))
vim.keymap.set('n', '<leader>Y', 'gg"+yG', opts('Yank entire file into system clipboard'))
vim.keymap.set('n', '<leader>D', 'gg"_dG', opts('Delete entire file without yanking it'))
vim.keymap.set('n', '<leader>R', 'gg"_dG"+p', opts('Replace entire file with system clipboard'))

-- Move selected lines
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", opts('Move line up'))
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", opts('Move line down'))
vim.keymap.set("v", ">", ">gv", opts("Indent right"))
vim.keymap.set("v", "<", "<gv", opts("Indent left"))

-- Diagnostic keymap
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts("Go to previous [D]iagnostic message"))
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts("Go to next [D]iagnostic message"))
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts("Show diagnostic [E]rror messages"))
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, opts("Open diagnostic quickfix list"))

-- vim-tmux-navigator
-- The plugin disables its defaults so these mappings stay safe when it is not
-- installed: Neovim split navigation still works and tmux is used at an edge.
local tmux_directions = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

for key, direction in pairs(tmux_directions) do
    vim.keymap.set("n", "<C-" .. key .. ">", function()
        local previous_window = vim.api.nvim_get_current_win()
        vim.cmd("wincmd " .. key)

        if vim.api.nvim_get_current_win() == previous_window then
            local command = "TmuxNavigate" .. direction
            if vim.fn.exists(":" .. command) == 2 then
                vim.cmd(command)
            end
        end
    end, opts("Navigate " .. direction:lower() .. " (Neovim/tmux)"))
end

-- tmux-sessionizer
-- Ctrl-f opens the Herdr or tmux project picker for the current environment.
-- Alt bindings run TS_SESSION_COMMANDS by index in the active project session.
vim.keymap.set('n', '<C-f>', function()
    if vim.env.HERDR_ENV == '1' then
        vim.cmd('silent !herdr-sessionizer')
    elseif vim.env.TMUX and vim.env.TMUX ~= '' then
        vim.cmd('silent !tmux neww tmux-sessionizer')
    else
        vim.cmd('silent !tmux-sessionizer')
    end
end, opts('Open environment sessionizer'))
vim.keymap.set(
    "n",
    "<M-1>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 0<cr>",
    opts('Runs TS_SESSION_COMMANDS[0]')
)
vim.keymap.set(
    "n",
    "<M-2>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 1<cr>",
    opts('Runs TS_SESSION_COMMANDS[1]')
)
vim.keymap.set(
    "n",
    "<M-3>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 2<cr>",
    opts('Runs TS_SESSION_COMMANDS[2]')
)
vim.keymap.set(
    "n",
    "<M-4>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 3<cr>",
    opts('Runs TS_SESSION_COMMANDS[3]')
)
