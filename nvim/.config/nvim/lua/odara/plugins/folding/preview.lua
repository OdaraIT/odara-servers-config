return {
  -- NOTE:  Plugin para pré-visualização de folds no Neovim.
  --  Mostra o conteúdo dobrado ao passar o cursor sobre um fold.
  --  Suporte para nvim-ufo e sistema de folds nativo.
  --  Altamente configurável, com opções de exibição personalizadas.
  --  Repositório: https://github.com/anuvyklack/fold-preview.nvim
  'anuvyklack/fold-preview.nvim',

  enabled = vim.g.odara.plugins.fold_preview_nvim,

  dependencies = {
    -- NOTE:  Plugin para modificar e estender mapeamentos de teclas no Neovim.
    --  Permite adicionar comportamento adicional a atalhos existentes.
    --  Suporte para encadeamento de comandos e manipulação de eventos.
    --  Útil para personalizar keybindings sem sobrescrever os originais.
    --  Repositório: https://github.com/anuvyklack/keymap-amend.nvim
    {
      'anuvyklack/keymap-amend.nvim',
      enabled = true,
    },

    -- NOTE:  Plugin avançado de folding para Neovim.
    --  Suporte a LSP, Treesitter e indentação para um folding mais preciso.
    --  Permite abrir e fechar folds de forma eficiente com atalhos personalizados.
    --  Integração com Lualine e pré-visualização de código dobrado.
    --  Repositório: https://github.com/kevinhwang91/nvim-ufo
    {
      'kevinhwang91/nvim-ufo',
      enabled = vim.g.odara.plugins.nvim_ufo,
    },
  },

  config = function()
    require('fold-preview').setup()
  end,
}
