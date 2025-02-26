return {
  -- NOTE:  Plugin avançado de folding para Neovim.
  --  Suporte a LSP, Treesitter e indentação para um folding mais preciso.
  --  Permite abrir e fechar folds de forma eficiente com atalhos personalizados.
  --  Integração com Lualine e pré-visualização de código dobrado.
  --  Repositório: https://github.com/kevinhwang91/nvim-ufo
  'kevinhwang91/nvim-ufo',

  enabled = vim.g.odara.plugins.nvim_ufo and vim.g.odara.plugins.promise_async,

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
  },

  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = 'marker'

    local ufo = require('ufo')

    ufo.setup({
      provider_selector = function(_, _, _)
        return { 'treesitter', 'indent' }
      end,
    })

    -- Keymaps {{{

    vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open All Folds [zR]' })
    vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close All Folds [zM]' })
    vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds, { desc = 'Open Folds Except Kinds [zr]' })
    vim.keymap.set('n', 'zm', ufo.closeFoldsWith, { desc = 'Cole Folds With [zm]' })

    -- }}}
  end,
}
