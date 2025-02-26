return {
  -- NOTE:   Explorador de arquivos altamente personalizável para Neovim.
  --   Suporte a buffers, Git, FS Watcher e integração com LSP.
  --   Usa janelas flutuantes e componentes interativos com nui.nvim.
  --   Configuração flexível com suporte a atalhos e exibição em painel lateral.
  --   Repositório: https://github.com/nvim-neo-tree/neo-tree.nvim
  'nvim-neo-tree/neo-tree.nvim',

  enabled = vim.g.odara.plugins.neo_tree_nvim and vim.g.odara.plugins.plenary_nvim and vim.g.odara.plugins.nui_nvim,

  branch = 'v3.x',

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

    -- NOTE:   Biblioteca de UI para criar interfaces personalizadas no Neovim.
    --   Fornece componentes como janelas flutuantes, menus e popups interativos.
    --   Utilizado por diversos plugins para melhorar a experiência visual.
    --   API flexível e modular, permitindo fácil personalização e extensibilidade.
    --   Repositório: https://github.com/MunifTanjim/nui.nvim
    {
      'MunifTanjim/nui.nvim',
      enabled = true,
    },
  },

  cmd = 'Neotree',

  keys = {
    { '<leader>ee', ':Neotree toggle<CR>', desc = 'Toggle File [E]xplor[e]r' },
  },

  config = function()
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Mostrar arquivos ocultos
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true }, -- Abre automaticamente o diretório do arquivo atual
        use_libuv_file_watcher = true, -- Atualização automática sem precisar de refresh manual
        hide_by_name = {
          'node_modules',
          '.git',
          '.DS_Store',
          'vendor',
          '__pycache__',
        },
        hide_by_pattern = {
          '*.log', -- Oculta todos os arquivos .log
          '*.tmp', -- Oculta todos os arquivos .tmp
          '*/cache/*', -- Oculta qualquer pasta chamada "cache"
        },
      },
      window = {
        width = 60,
        mappings = {
          ['<CR>'] = 'open',
          ['o'] = 'open',
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',
          ['t'] = 'open_tabnew',
          ['h'] = 'navigate_up',
          ['l'] = 'set_root',
          ['R'] = 'refresh',
        },
      },
      git_status = {
        symbols = {
          added = '✚',
          modified = '',
          deleted = '✖',
          renamed = '󰁕',
          untracked = '★',
        },
      },
    })
  end,
}
