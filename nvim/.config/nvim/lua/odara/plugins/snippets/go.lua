return {
  -- NOTE:   Plugin para desenvolvimento em Go no Neovim.
  --   Suporte a formatação, linting, execução e depuração de código Go.
  --   Integra-se com LSP, Treesitter, DAP e ferramentas como `gopls` e `dlv`.
  --   Comandos para testar, compilar e navegar pelo código de forma eficiente.
  --   Repositório: https://github.com/ray-x/go.nvim
  'ray-x/go.nvim',

  enabled = vim.g.odara.plugins.snippets_go_nvim,

  dependencies = { 'nvim-treesitter/nvim-treesitter' },

  config = function()
    require('go').setup()
  end,
}
