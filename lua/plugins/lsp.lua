-- This file configures the NeoVim LSP client and LSP servers
--
-- The NeoVim LSP client is configured using nvim-lspconfig together with
-- mason and mason-lspconfig
--
-- Plugins:
-- + lspconfig: A data-only plugin with useful default configs for nvim's lsp
--   config
-- + mason: An LSP server manager
-- + mason-lspconfig: bridge between mason and lspconfig
-- + lazydev: add `vim` globals support for neovim (to enable autocompletion
--   when configuring neovim.)

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "pyright",
    },
  },
  dependencies = {
    -- manage LSP servers
    { "mason-org/mason.nvim", opts = {} },
    -- manage LSP client
    { "neovim/nvim-lspconfig" },
    -- Add `vim` globals for vim configuration
    {
      "folke/lazydev.nvim",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    -- setup LSP server configs
    -- TODO: somehow manage this with handlers???
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})

    -- LSP functinality bindings
    vim.api.nvim_create_autocmd('LspAttach', {
      -- this callback will be called each time the LspAttach hook is entered
      callback = function(args)
        -- early exit if the client cannot be found
        local c = vim.lsp.get_client_by_id(args.data.client_id)
        if not c then return end

        local bind_method_normal_key = function(key_binding, method, method_opts)
          method_opts = method_opts or {}
          local opts = { buffer = true }
          vim.keymap.set('n', key_binding, function() method(method_opts) end, opts)
        end
        bind_method_normal_key('K', vim.lsp.buf.hover, { border = "single" })
        bind_method_normal_key('<leader>ld', vim.lsp.buf.definition)
        bind_method_normal_key('<leader>lD', vim.lsp.buf.declaration)
        bind_method_normal_key('<leader>li', vim.lsp.buf.implementation)
        bind_method_normal_key('<leader>lt', vim.lsp.buf.type_definition)
        bind_method_normal_key('<leader>lr', vim.lsp.buf.references)
        bind_method_normal_key('<leader>ls', vim.lsp.buf.signature_help)
        -- refactor rename
        bind_method_normal_key('<leader>R', vim.lsp.buf.rename)
        bind_method_normal_key('<leader>la', vim.lsp.buf.code_action)
        bind_method_normal_key('<leader>lf', vim.lsp.buf.open_float)
        bind_method_normal_key('[d', vim.lsp.buf.goto_prev)
        bind_method_normal_key(']d', vim.lsp.buf.goto_next)
        -- format file
        bind_method_normal_key('<leader>F',
          vim.lsp.buf.format, { bufnr = args.buf, id = c.id }
        )
      end,
    })
  end,
}
