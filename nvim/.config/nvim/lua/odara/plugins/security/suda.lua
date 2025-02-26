return {
  -- NOTE:  Permite salvar arquivos como root no Neovim sem precisar reiniciá-lo com sudo.
  --  Usa `:SudaWrite` e `:SudaRead` para escrita e leitura de arquivos protegidos.
  --  Funciona de forma transparente e sem necessidade de modificar permissões.
  --  Simples, leve e sem dependências externas.
  --  Repositório: https://github.com/lambdalisue/vim-suda
  'lambdalisue/vim-suda',

  enabled = vim.g.odara.plugins.vim_suda,

  cmd = { 'SudaRead', 'SudaWrite' },

  keys = {
    { '<leader>ws', '<cmd>SudaWrite<cr>', desc = '[W]rite with [S]udo' },
    { '<leader>rs', '<cmd>SudaRead<cr>', desc = '[R]ead with [S]udo' },
  },
}
