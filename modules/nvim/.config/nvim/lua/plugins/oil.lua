-- Edit directories like normal buffers
return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = true,

        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        view_options = {
            show_hidden = true,
            natural_order = 'fast',
            sort = {
                { 'type', 'asc' },
                { 'name', 'asc' },
            },
        },

        keymaps = {
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-k>"] = false,
            ["<C-j>"] = false,

            ["<leader>v"] = "actions.select_vsplit",
            ["<leader>s"] = "actions.select_split",
            ["<leader>p"] = {
                'actions.preview',
                opts = {
                    vertical = true,
                    split = 'belowright'
                },
            },
            ["<leader>r"] = "actions.refresh",
            ["<leader>."] = "actions.toggle_hidden",
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    keys = {
        { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
        { '<M-->', '<cmd>Oil .<cr>', desc = 'Open oil at cwd' },
    },
}
