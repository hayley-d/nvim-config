return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "mfussenegger/nvim-jdtls",
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            --local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            -- setup lua langauge server
            lspconfig.lua_ls.setup({
                --capabilities = capabilities
            })
            -- setup ts language server
            lspconfig.ts_ls.setup({
                --capabilities = capabilities
            })
            -- setup html language server
            lspconfig.html.setup({
                --capabilities = capabilities
            })
            -- c++ setup
            lspconfig.clangd.setup({
                --capabilities = capabilities
            })
            -- Python LSP setup
            lspconfig.pyright.setup({
                --capabilities = capabilities
            })
            -- Autoformat Python on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.py",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
            -- Rust LSP setup
            lspconfig.rust_analyzer.setup({
                --capabilities = capabilities
                settings = {
                    ["rust-analyzer"] = {
                        assist = {
                            importGranularity = "module",
                            importPrefix = "by_self",
                        },
                        cargo = {
                            allFeatures = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            })

            -- Ocaml LSP setup
            lspconfig.ocamllsp.setup({
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.ml,*.mli",
                callback = function()
                    vim.lsp.buf.format()
                end,
            })


            -- Go LSP setup
            lspconfig.gopls.setup({
                cmd = { "gopls" },
                filetypes = { "go", "gomod" },
                root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
                --capabilities = capabilities
            })
            -- setup eslint
            lspconfig.eslint.setup({
                bin = "eslint",
                code_actions = {
                    enable = true,
                    apply_on_save = {
                        enable = true,
                        types = { "directive", "problem", "suggestion", "layout" },
                    },
                    disable_rule_comment = {
                        enable = true,
                        location = "separate_line",
                    },
                },
                diagnostics = {
                    enable = true,
                    report_unused_disable_directives = false,
                    run_on = "type", -- or `save`
                },
            })

            -- OCaml setup
            lspconfig.ocamllsp.setup({
                cmd = { "ocamllsp" },
                filetypes = { "ml", "reason" },
                root_dir = lspconfig.util.root_pattern("*.opam", ".merlin", ".git"),
            })

            lspconfig.zls.setup({
            })

            -- vim motion for <shift> + k to show documentation about the code under the cursor
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            -- vim motion for g + d to go to where the code under the cursor is defined
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            -- vim motion for <shift> + c + a to display code suggestions for the code
            vim.keymap.set({ "n", "v" }, "CA", vim.lsp.buf.code_action, {})
            -- vim motion for <space> + c + <shift> + r to smart rename code under cursor
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "Code Rename" })
            -- Function to enable diagnostics on hover
            local function setup_diagnostics_hover()
                vim.keymap.set("n", "<leader>CK", function()
                    local opts = {
                        focusable = true,
                        border = "rounded",
                        source = "always",
                        prefix = "",
                        scope = "cursor",
                    }
                    vim.diagnostic.open_float(nil, opts)
                end, { desc = "Show diagnostics under cursor" })
            end
        end,
    },
    -- Adding rust.vim for Rust support
    {
        "rust-lang/rust.vim",
        ft = "rust",                   -- Load only for Rust files
        config = function()
            vim.g.rustfmt_autosave = 1 -- Enable autoformat on save
        end,
    },
    {
        "ziglang/zig.vim",
        ft = "zig",
        config = function()
            vim.g.zig_fmt_parse_errors = 0
            vim.g.zig_fmt_autosave = 1
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.zig", "*.zon" },
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end,
    },
}
