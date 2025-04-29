return {

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

            vim.cmd.colorscheme("rose-pine")
        end,
    },
    -- Catppuccin color scheme setup
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 100,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,  -- Force no italic
                no_bold = false,    -- Force no bold
                no_underline = false, -- Force no underline
                styles = {          -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                color_overrides = {},
                custom_highlights = {},
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                },
            })
            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function()
                    local ft = vim.bo.filetype
                    if ft ~= "js" and ft ~= "c" then
                        vim.cmd.colorscheme("rose-pine")
                        --vim.cmd.colorscheme("catppuccin")
                    else
                        vim.cmd.colorscheme("catppuccin")
                        --vim.cmd.colorscheme("rose-pine")
                    end
                end,
            })
        end,
    },
    -- Dracula color scheme setup
    {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    config = function()
        local dracula = require("dracula")
        dracula.setup({
            colors = {
                bg = "#282A36",
                fg = "#F8F8F2",
                selection = "#44475A",
                comment = "#6272A4",
                red = "#FF5555",
                orange = "#FFB86C",
                yellow = "#F1FA8C",
                green = "#50fa7b",
                purple = "#BD93F9",
                cyan = "#8BE9FD",
                pink = "#FF79C6",
                bright_red = "#FF6E6E",
                bright_green = "#69FF94",
                bright_yellow = "#FFFFA5",
                bright_blue = "#D6ACFF",
                bright_magenta = "#FF92DF",
                bright_cyan = "#A4FFFF",
                bright_white = "#FFFFFF",
                menu = "#21222C",
                visual = "#3E4452",
                gutter_fg = "#4B5263",
                nontext = "#3B4048",
                white = "#ABB2BF",
                black = "#191A21",
            },
            show_end_of_buffer = true,
            transparent_bg = true,
            lualine_bg_color = "#44475a",
            italic_comment = true,
            overrides = {},
        })

        -- Use Dracula for cpp files
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                local ft = vim.bo.filetype
                if ft == "cpp" then
                    vim.cmd.colorscheme("dracula")
                end
            end,
        })
    end,
},
}
