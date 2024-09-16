return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls","ts_ls"}
      })
    end
  },
  {
    'mfussenegger/nvim-jdtls',
  },
  {
    "neovim/nvim-lspconfig",
       config = function()
      local lspconfig = require("lspconfig")
      -- setup lua langauge server
      lspconfig.lua_ls.setup({})
      -- setup ts language server
      lspconfig.ts_ls.setup({})
      
      -- vim motion for <shift> + k to show documentation about the code under the cursor
      vim.keymap.set('n','K',vim.lsp.buf.hover,{})
      -- vim motion for g + d to go to where the code under the cursor is defined
      vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
      -- vim motion for <shift> + c + a to display code suggestions for the code
      vim.keymap.set({'n','v'}, 'CA',vim.lsp.buf.code_action,{})
      -- vim motion for <space> + c + <shift> + r to smart rename code under cursor
      vim.keymap.set('n','<leader>cR', vim.lsp.buf.rename, {desc = 'Code Rename'})
    end
  }
}
