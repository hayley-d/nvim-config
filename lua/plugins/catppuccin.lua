return {
    -- Catppuccin color scheme setup
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 100,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    -- Rose-pine color scheme setup
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main",
                dark_variant = "main",
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true,
                    migrations = true,
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },
            })

            -- Set rose-pine as default color scheme for non-C/Go files
            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function()
                    local ft = vim.bo.filetype
                    if ft ~= "go" and ft ~= "c" then
                        vim.cmd.colorscheme("catppuccin")
                    else
                        vim.cmd.colorscheme("rose-pine")
                    end
                end,
            })
        end,
    },
}
