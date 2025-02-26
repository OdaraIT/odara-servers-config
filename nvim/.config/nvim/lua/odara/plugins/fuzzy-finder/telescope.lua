return {
  -- NOTE:  Fuzzy finder altamente extensível para Neovim.
  --  Busca rápida em arquivos, buffers, LSP, comandos e muito mais.
  --  Integra-se com ripgrep, fd, fzf e plugins externos.
  --  Altamente configurável e personalizável com atalhos e extensões.
  --  Repositório: https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',

  event = 'VimEnter',

  branch = '0.1.x',

  enabled = vim.g.odara.plugins.telescope_nvim and vim.g.odara.plugins.plenary_nvim,

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

    -- NOTE:  Extensão do Telescope para busca ultrarrápida com FZF nativo.
    --  Usa C para melhor desempenho na correspondência fuzzy.
    --  Suporte a ordenação inteligente e prévia rápida de resultados.
    --  Requer compilação, mas melhora significativamente a velocidade de busca.
    --  Repositório: https://github.com/nvim-telescope/telescope-fzf-native.nvim
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      enabled = true,
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },

    -- NOTE:  Substitui `vim.ui.select` pela interface do Telescope no Neovim.
    --  Permite usar a experiência do Telescope para menus de seleção.
    --  Melhora a navegação e a busca em diálogos interativos.
    --  Leve, fácil de configurar e compatível com outros plugins.
    --  Repositório: https://github.com/nvim-telescope/telescope-ui-select.nvim
    {
      'nvim-telescope/telescope-ui-select.nvim',
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

    -- NOTE: Extensão do Telescope para integração com o LuaSnip no Neovim.
    -- Permite pesquisar e inserir snippets do LuaSnip através da interface do Telescope.
    -- Facilita a visualização e inserção de trechos de código de forma interativa.
    -- Repositório: https://github.com/benfowler/telescope-luasnip.nvim
    {
      'benfowler/telescope-luasnip.nvim',
      enabled = vim.g.odara.plugins.luasnip and vim.g.odara.plugins.telescope_luasnip_nvim,
    },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    telescope.setup({
      defaults = {
        mappings = {
          i = { ['<C-Enter>'] = 'to_fuzzy_refine' },
        },

        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--hidden',
          '--smart-case',
          -- '--ignore-file',
          -- '.gitignore',
          -- '--exclude',
          -- 'node_modules',
          -- '--exclude',
          -- 'build',
          -- '--exclude',
          -- '.env',
          -- '--exclude',
          -- '*.log',
          -- '--exclude',
          -- 'vendor',
          -- '--exclude',
          -- '*.phar',
          -- '--exclude',
          -- '*.bak',
        },

        file_ignore_patterns = {
          'node_modules', -- Ignora node_modules
          'build', -- Ignora build
          '.git', -- Ignora diretórios .git
          '*.log', -- Ignora arquivos de log
          '.env', -- Ignora arquivos .env
          'vendor', -- Ignora diretório vendor (Composer)
          '*.phar', -- Ignora arquivos PHAR (PHP Archive)
          '*.bak', -- Ignora arquivos de backup
        },
      },

      pickers = {
        find_files = {
          hidden = vim.g.odara.show_ignored_files,
          -- no_ignore = vim.g.odara.telescope.pickers.find_files.no_ignore or false,
          -- no_ignore_parent = vim.g.odara.telescope.pickers.find_files.no_ignore_parent or false,
        },
      },

      extensions = {
        ['ui-select'] = {
          themes.get_dropdown(),
        },

        fzf = {},
      },
    })

    -- Extensions Loader {{{

    telescope.load_extension('ui-select')
    telescope.load_extension('fzf')

    if vim.g.odara.plugins.noice_nvim then
      telescope.load_extension('noice')
    end

    if vim.g.odara.plugins.luasnip and vim.g.odara.plugins.telescope_luasnip_nvim then
      telescope.load_extension('luasnip')
    end

    --- }}}

    -- Keymaps {{{

    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sF', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sm', '<cmd>Telescope marks<cr>', { desc = '[S]earch [M]arks' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })
    vim.keymap.set('n', '<leader>so', builtin.vim_options, { desc = '[S]earch Neovim [O]ptions' })
    vim.keymap.set('n', '<leader>sh', builtin.search_history, { desc = '[S]earch [H]istory' })

    -- Fuzzy find no buffer atual
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Live Grep nos arquivos abertos
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      })
    end, { desc = '[S]earch [/] in Open Files' })

    -- Buscar na configuração do Neovim
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[S]earch [N]eovim files' })

    -- }}}
  end,
}
