-- Disable tmux navigation keys inside lazygit terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Disable tmux navigation keys inside lazygit terminal buffers",
    pattern = "*",
    callback = function(event)
        local name = vim.api.nvim_buf_get_name(event.buf)

        if name:match("lazygit") then
            vim.keymap.set("t", "<C-j>", "<C-j>", { buffer = event.buf, silent = true })
            vim.keymap.set("t", "<C-k>", "<C-k>", { buffer = event.buf, silent = true })
        end
    end,
})

-- Grapple tag list bugger mappings
vim.api.nvim_create_autocmd("FileType", {
    desc = "Grapple tag list bugger mappings",
    pattern = "grapple",
    callback = function(event)
        local opts = { buffer = event.buf, silent = true }

        vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
        vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
    end,
})

-- Trim trailing whitespace before saving most files.
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Trim trailing whitespace on save",
    callback = function()
        -- ignore markdown files
        if vim.bo.filetype == "markdown" then
            return
        end

        local view = vim.fn.winsaveview()

        vim.cmd([[%s/\s\+$//e]])

        vim.fn.winrestview(view)
    end,
})

-- Auto-realods file when they change when they change externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    desc = "Auto-reload file when changed externally",
    command = "checktime",
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
