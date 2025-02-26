return {
  -- NOTE:  Maximiza e restaura janelas no Neovim com um único comando.
  --  Mantém o layout original ao restaurar a visualização.
  --  Funciona em splits horizontais e verticais sem alterar buffers.
  --  Simples, leve e sem dependências externas.
  --  Repositório: https://github.com/szw/vim-maximizer
  'szw/vim-maximizer',

  enabled = vim.g.odara.plugins.vim_maximizer or false,

  keys = {
    { '<leader>sm', '<cmd>MaximizerToggle<CR>', desc = '[S]plit: [M]aximize (or Minimize)' },
  },
}
