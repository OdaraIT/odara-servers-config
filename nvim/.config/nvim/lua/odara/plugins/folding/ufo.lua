return {
  -- NOTE:  Plugin avançado de folding para Neovim.
  --  Suporte a LSP, Treesitter e indentação para um folding mais preciso.
  --  Permite abrir e fechar folds de forma eficiente com atalhos personalizados.
  --  Integração com Lualine e pré-visualização de código dobrado.
  --  Repositório: https://github.com/kevinhwang91/nvim-ufo
  'kevinhwang91/nvim-ufo',

  enabled = vim.g.odara.plugins.nvim_ufo and vim.g.odara.plugins.promise_async and vim.g.odara.plugins.nvim_lspconfig,

  dependencies = {
    -- NOTE:  Biblioteca de Promises assíncronas para Neovim em Lua.
    --  Utilizada para facilitar operações assíncronas sem callbacks aninhados.
    --  Oferece uma API semelhante às Promises do JavaScript.
    --  Dependência essencial para plugins como nvim-ufo.
    --  Repositório: https://github.com/kevinhwang91/promise-async
    {
      'kevinhwang91/promise-async',
      enabled = true,
    },

    -- NOTE:  Coleção de configurações prontas para servidores LSP no Neovim.
    --  Facilita a configuração e gerenciamento de LSPs com opções personalizáveis.
    --  Integra-se com mason.nvim para instalação automática de servidores.
    --  Repositório: https://github.com/neovim/nvim-lspconfig
    {
      'neovim/nvim-lspconfig',
      enabled = true,
    },
  },

  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 0
    vim.o.foldenable = true
    vim.o.foldmethod = 'marker'

    local ufo = require('ufo')

    ufo.setup({
      enable_get_fold_virt_text = true,
      open_fold_hl_timeout = 150,

      close_fold_kinds_for_ft = {
        default = { 'imports', 'comment' },
        c = { 'comment', 'region' },
      },

      preview = {
        win_config = {
          border = { '', '─', '', '', '', '─', '', '' },
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },

        mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = '[',
          jumpBot = ']',
        },
      },
    })

    -- Keymaps {{{

    vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open All Folds [zR]' })
    vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close All Folds [zM]' })
    vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds, { desc = 'Open Folds Except Kinds [zr]' })
    vim.keymap.set('n', 'zm', ufo.closeFoldsWith, { desc = 'Close Folds With [zm]' })

    -- }}}
  end,
}
