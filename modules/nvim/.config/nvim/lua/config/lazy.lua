-- lazy.nvim must be installed through an approved process before this module is
-- enabled from init.lua. Never clone or bootstrap it from a work configuration.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    return
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },

    change_detection = { notify = false },

    install = {
        colorscheme = { "habamax" },
    },

    checker = {
        enabled = true,
    },

    performance = {
        cache = {
            enabled = false,
        },
    },
})
