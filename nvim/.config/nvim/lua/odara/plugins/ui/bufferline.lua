return {
  -- NOTE:  Gerencia buffers como abas no Neovim com uma interface moderna.
  --  Suporte a ícones, separadores e indicadores de buffer ativo.
  --  Integra-se com nvim-web-devicons e temas personalizados.
  --  Configurável com atalhos para navegação e manipulação de buffers.
  --  Repositório: https://github.com/akinsho/bufferline.nvim
  'akinsho/bufferline.nvim',

  enabled = vim.g.odara.plugins.bufferline_nvim or false,

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
  },

  version = '*',

  opts = {
    options = {
      mode = 'tabs',
    },
  },
}
