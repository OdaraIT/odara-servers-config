return {
  -- NOTE:  Gerenciador de arquivos em árvore para Neovim.
  --  Suporte a ícones, atalhos e integração com git.
  --  Permite navegação rápida e manipulação de arquivos diretamente no editor.
  --  Leve, altamente configurável e substitui o netrw.
  --  Repositório: https://github.com/nvim-tree/nvim-tree.lua
  'nvim-tree/nvim-tree.lua',

  enabled = vim.g.odara.plugins.nvim_tree_lua
    and vim.g.odara.plugins.nvim_config_local
    and vim.g.odara.plugins.nvim_web_devicons,

  dependencies = {
    -- NOTE:  Plugin para carregar configurações locais no Neovim.
    --  Permite executar arquivos `.nvim.lua`, `.nvimrc.lua` e similares em diretórios específicos.
    --  Suporte a listas de permissões e confirmações para segurança.
    --  Útil para projetos que exigem configurações específicas sem poluir a config global.
    --  Repositório: https://github.com/klen/nvim-config-local
    {
      'klen/nvim-config-local',
      enabled = true,
    },

    -- NOTE:  Ícones para arquivos e diretórios no Neovim.
    --  Integra-se com plugins como nvim-tree, telescope e lualine.
    --  Suporte a múltiplos temas e personalização de ícones.
    --  Requer uma fonte Nerd Font para exibição correta.
    --  Repositório: https://github.com/nvim-tree/nvim-web-devicons
    {
      'nvim-tree/nvim-web-devicons',
      enabled = true,
    },
  },

  config = function()
    local nvimtree = require('nvim-tree')

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      respect_buf_cwd = true,

      view = {
        width = 60,
        relativenumber = false,
        cursorline = true,
        preserve_window_proportions = true,
      },

      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },

      renderer = {
        indent_markers = {
          enable = false,
        },

        icons = {
          git_placement = 'after',
          webdev_colors = true,
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },

          glyphs = {
            default = '',
            symlink = '',
            folder = {
              arrow_closed = '   ',
              arrow_open = '   ',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
            git = {
              unstaged = '',
              staged = '',
              unmerged = '',
              renamed = '➜',
              untracked = '',
              deleted = '',
              ignored = '◌',
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = vim.g.odara.global.files.tree_ignore_patterns,
        dotfiles = vim.g.odara.global.files.dotfiles,
        git_ignored = not vim.g.odara.global.files.git_no_ignore,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 10000,
      },
    })

    local keymap = vim.keymap

    keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle File [E]xplor[e]r' })
    keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'File [E]xplorer: [C]ollapse' })
    keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'File [E]xplorer: [R]efresh' })
  end,
}
