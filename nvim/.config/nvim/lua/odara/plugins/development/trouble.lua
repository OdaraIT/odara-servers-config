return {
  -- NOTE:  Exibe diagnósticos, quickfix, LSP references e todo-comments em uma lista organizada.
  --  Interface intuitiva para navegação rápida entre erros e avisos.
  --  Integra-se com LSP, Telescope, todo-comments e outros plugins.
  --  Suporte a atalhos para abrir, fechar e filtrar resultados facilmente.
  --  Repositório: https://github.com/folke/trouble.nvim
  'folke/trouble.nvim',

  enabled = vim.g.odara.plugins.trouble_nvim or false,

  dependencies = {
    -- NOTE:  Ícones para arquivos e diretórios no Neovim.
    --  Integra-se com plugins como nvim-tree, telescope e lualine.
    --  Suporte a múltiplos temas e personalização de ícones.
    --  Requer uma fonte Nerd Font para exibição correta.
    --  Repositório: https://github.com/nvim-tree/nvim-web-devicons
    {
      'nvim-tree/nvim-web-devicons',
      enabled = vim.g.odara.plugins.nvim_web_devicons or false,
    },

    -- NOTE: Realça e gerencia comentários como TODO, FIX, HACK e outros no código.
    -- Suporte a destaque visual, navegação e integração com Telescope.
    -- Permite adicionar palavras-chave personalizadas para melhor organização.
    -- Repositório: https://github.com/folke/todo-comments.nvim
    {
      'folke/todo-comments.nvim',
      enabled = vim.g.odara.plugins.todo_comments_nvim or false,
    },
  },

  opts = { focus = true },

  cmd = 'Trouble',

  -- FIX: Rever os keymaps e suas descrições.
  keys = {
    { '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Open trouble workspace diagnostics' },
    { '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Open trouble document diagnostics' },
    { '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', desc = 'Open trouble quickfix list' },
    { '<leader>xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Open trouble location list' },
    { '<leader>xt', '<cmd>Trouble todo toggle<CR>', desc = 'Open todos in trouble' },
  },
}
