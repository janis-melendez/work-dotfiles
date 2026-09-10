-- Git commands with :Git or :G
return {
    'tpope/vim-fugitive',
    cmd = {
        'G',
        'Git',
        'Gdiffsplit',
        'Gvdiffsplit',
        'Ghdiffsplit',
    },
    keys = {
        { '<leader>g:', ':G' , desc = 'Fugitive Git command' },
        { '<leader>gs', '<cmd>Git<cr>', desc = 'Git status' },
        { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git blame' },
        { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
        { '<leader>gl', '<cmd>Git log<cr>', desc = 'Git log' },
        { '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git diff' },
    },
}
