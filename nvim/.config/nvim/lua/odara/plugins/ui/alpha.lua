return {
  -- NOTE:  Tela inicial altamente customizável para o Neovim.
  --  Suporte a atalhos, cabeçalhos personalizados e integração com plugins.
  --  Exibe sessões recentes, atalhos rápidos e informações úteis no startup.
  --  Leve, rápido e fácil de configurar com temas prontos.
  --  Repositório: https://github.com/goolord/alpha-nvim
  'goolord/alpha-nvim',

  enabled = vim.g.odara.plugins.alpha_nvim and vim.g.odara.plugins.plenary_nvim,

  event = 'VimEnter',

  dependencies = {
    -- NOTE:  Biblioteca auxiliar com funções utilitárias para desenvolvimento em Lua no Neovim.
    --  Fornece manipulação de arquivos, async, paths, jobs e mais.
    --  Dependência essencial para diversos plugins, como Telescope e nvim-lint.
    --  Facilita desenvolvimento de plugins com API unificada e eficiente.
    --  Repositório: https://github.com/nvim-lua/plenary.nvim
    {
      'nvim-lua/plenary.nvim',
      enabled = true,
    },

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

  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
      dashboard.button('SPC ee', '  > Toggle File [E]xplor[e]r', ':lua Snacks.explorer()<CR>'),
      dashboard.button('SPC sf', '󰱼  > [S]earch [F]iles', '<cmd>Telescope find_files<cr>'),
      dashboard.button('SPC sg', '  > [S]earch by [G]rep', '<cmd>Telescope live_grep<cr>'),
      -- dashboard.button('SPC wr', '󰁯  > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
      dashboard.button('q', '  > Quit NVIM', '<cmd>qa<CR>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
