-- Sets filetypes for files Neovim may not detect correctly
vim.filetype.add({
    filename = {
        [".zshrc"] = "zsh",
        [".zprofile"] = "zsh",
        [".zshenv"] = "zsh",
        [".zlogin"] = "zsh",
    },
    extension = {
        zsh = "zsh",
    },
    pattern = {
        [".*/%.config/ghostty/config$"] = "ghostty",
        [".*/%.config/zsh/.*%.zsh"] = "zsh",
    },
})
