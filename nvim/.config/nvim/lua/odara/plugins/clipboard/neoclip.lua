return {
  -- NOTE:  Gerencia o histórico de yanks e pastes no Neovim.
  --  Integra-se com Telescope e fzf-lua para busca rápida.
  --  Suporte a histórico persistente utilizando sqlite.lua.
  --  Configuração flexível com filtros e ações personalizadas.
  --  Repositório: https://github.com/AckslD/nvim-neoclip.lua
  'AckslD/nvim-neoclip.lua',

  enabled = vim.g.odara.plugins.nvim_neoclip_lua,

  dependencies = {
    -- NOTE:  Fuzzy finder altamente extensível para Neovim.
    --  Busca rápida em arquivos, buffers, LSP, comandos e muito mais.
    --  Integra-se com ripgrep, fd, fzf e plugins externos.
    --  Altamente configurável e personalizável com atalhos e extensões.
    --  Repositório: https://github.com/nvim-telescope/telescope.nvim
    {
      'nvim-telescope/telescope.nvim',
      enabled = vim.g.odara.plugins.telescope_nvim or false,
    },

    -- NOTE:  Fornece uma interface leve para SQLite no Neovim via Lua.
    --  Usa FFI para alto desempenho sem dependências externas.
    --  Suporte a operações SQL assíncronas e sincronas.
    --  Utilizado por plugins como nvim-neoclip.lua para histórico persistente.
    --  Repositório: https://github.com/kkharji/sqlite.lua
    {
      'kkharji/sqlite.lua',
      enabled = vim.g.odara.plugins.sqlite_lua or false,
      module = 'sqlite',
    },
  },

  config = function()
    local neoclip = require('neoclip')

    neoclip.setup({
      history = 1000,
      enable_persistent_history = false,
      length_limit = 1048576,
      continuous_sync = false,
      db_path = vim.fn.stdpath('data') .. '/databases/neoclip.sqlite3',
      filter = nil,
      preview = true,
      prompt = nil,
      default_register = '"',
      default_register_macros = 'q',
      enable_macro_history = true,
      content_spec_column = false,
      disable_keycodes_parsing = false,
      dedent_picker_display = false,
      initial_mode = 'insert',
      on_select = {
        move_to_front = false,
        close_telescope = true,
      },
      on_paste = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_replay = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_custom_action = {
        close_telescope = true,
      },
      keys = {
        telescope = {
          i = {
            select = '<cr>',
            paste = '<c-p>',
            paste_behind = '<c-k>',
            replay = '<c-q>', -- replay a macro
            delete = '<c-d>', -- delete an entry
            edit = '<c-e>', -- edit an entry
            custom = {},
          },
          n = {
            select = '<cr>',
            paste = 'p',
            --- It is possible to map to more than one key.
            -- paste = { 'p', '<c-p>' },
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
            edit = 'e',
            custom = {},
          },
        },
        fzf = {
          select = 'default',
          paste = 'ctrl-p',
          paste_behind = 'ctrl-k',
          custom = {},
        },
      },
    })
  end,
}
