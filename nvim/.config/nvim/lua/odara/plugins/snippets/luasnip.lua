return {
  -- NOTE:  Sistema de snippets poderoso e extensível para Neovim.
  --  Suporte a múltiplos gatilhos, placeholders dinâmicos e expansões aninhadas.
  --  Integra-se com nvim-cmp para autocompletar snippets.
  --  Totalmente configurável, permitindo criação e personalização de snippets.
  --  Repositório: https://github.com/L3MON4D3/LuaSnip
  'L3MON4D3/LuaSnip',

  enabled = vim.g.odara.plugins.cmp_luasnip or false,

  version = 'v2.*',

  build = 'make install_jsregexp',

  dependencies = {
    -- NOTE:  Coleção de snippets pré-definidos para diversas linguagens no Neovim.
    --  Compatível com LuaSnip, snippy e outros sistemas de snippets.
    --  Inclui atalhos para frameworks e bibliotecas populares.
    --  Fácil de expandir e personalizar conforme necessário.
    --  Repositório: https://github.com/rafamadriz/friendly-snippets
    {
      'rafamadriz/friendly-snippets',
      enabled = vim.g.odara.plugins.friendly_snippets or false,
    },
  },

  config = function()
    local luasnip = require('luasnip')

    if vim.g.odara.plugins.friendly_snippets then
      require('luasnip.loaders.from_vscode').lazy_load()
    end

    luasnip.setup()
  end,
}
