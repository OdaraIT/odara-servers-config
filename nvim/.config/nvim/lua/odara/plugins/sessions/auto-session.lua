return {
  -- NOTE:  Gerencia sessões automaticamente no Neovim.
  --  Salva e restaura sessões ao abrir e fechar o editor.
  --  Suporte a múltiplos diretórios e detecção automática de projetos.
  --  Configuração flexível com integração ao Telescope.
  --  Repositório: https://github.com/rmagatti/auto-session
  'rmagatti/auto-session',

  enabled = vim.g.odara.plugins.auto_session or false,

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

    -- NOTE:  Extensão do auto-session para buscar sessões com Telescope.
    --  Permite listar, pesquisar e carregar sessões salvas rapidamente.
    --  Integração fluida com auto-session e atalhos personalizáveis.
    --  Leve, eficiente e fácil de configurar.
    --  Repositório: https://github.com/rmagatti/session-lens
    {
      'rmagatti/session-lens',
      enabled = vim.g.odara.plugins.telescope_nvim and vim.g.odara.plugins.session_lens,
    },
  },

  config = function()
    local auto_session = require('auto-session')

    auto_session.setup({
      auto_session_suppress_dirs = { '~/', '~/Dev', '~/Downloads', '~/Documents', '~/Desktop' },
      log_level = 'error',
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = false,
      session_lens = {
        load_on_setup = false,
        theme_conf = { border = true },
        previewer = true,
      },
    })

    -- TODO: Verificar integração com o Telescope.
    if vim.g.odara.plugins.telescope_nvim and vim.g.odara.plugins.session_lens then
      require('session-lens').setup({})
    end

    local keymap = vim.keymap

    keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = '[W]indow (Session) [R]estore Root Directory' })
    keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = '[W]indow (Session) [S]ave Root Directory' })
  end,
}
