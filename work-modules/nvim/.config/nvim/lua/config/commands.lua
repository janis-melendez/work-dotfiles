-- Clear search highlights
vim.api.nvim_create_user_command(
    'ClearSearch',
    function()
        vim.cmd("nohlsearch")
    end,
    {
        desc = 'Clear search highlights',
    }
)

-- Trim trailing whitespace in the current file
vim.api.nvim_create_user_command(
    'TrimWhitespace',
    function()
        local view = vim.fn.winsaveview()

        vim.cmd([[%s/\s\+$//e]])

        vim.fn.winrestview(view)
    end,
    {
        desc = 'Trim trailing whitespace',
    }
)
