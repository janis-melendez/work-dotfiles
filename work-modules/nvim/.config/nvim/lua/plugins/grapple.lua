-- Bookmark and jump between project files
return {
    'cbochs/grapple.nvim',
    opts = {
        -- Decides which tag list Grapple uses.
        -- "git" shares one tag list across all branches in a repo.
        -- "git_branch" keeps separate tag lists per repo + branch.
        ---@type 'git' | 'git_branch'
        scope = 'git',

        -- Grapple popup window size/position.
        win_opts = {
            width = 80,
            height = 12,
            row = 0.5,
            col = 0.5,

            relative = 'editor',
            border = 'single',
            focusable = false,
            style = 'minimal',

            title = 'Grapple',
            title_pos = 'center',
        },
    },
    keys = {
        {
            '<leader>m',
            function()
                require('grapple').toggle()
            end,
            desc = 'Add/remove current file'
        },

        {
            '<leader>M',
            function()
                require('grapple').toggle_tags()
            end,
            desc = 'Open/close tag list',
        },

        -- Jump to Grapple tags by index.
        { '<leader>1', '<cmd>Grapple select index=1<cr>', desc = 'Jump to grapple index 1' },
        { '<leader>2', '<cmd>Grapple select index=2<cr>', desc = 'Jump to grapple index 2' },
        { '<leader>3', '<cmd>Grapple select index=3<cr>', desc = 'Jump to grapple index 3' },
        { '<leader>4', '<cmd>Grapple select index=4<cr>', desc = 'Jump to grapple index 4' },
        { '<leader>5', '<cmd>Grapple select index=5<cr>', desc = 'Jump to grapple index 5' },
    },
}
