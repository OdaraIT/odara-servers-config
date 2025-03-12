return {
  -- NOTE:  Formatação assíncrona e configurável para múltiplas linguagens no Neovim.
  --  Suporte a diversos formatters com fallback automático.
  --  Integração com autocmds para formatação ao salvar arquivos.
  --  Leve, sem dependências externas e fácil de configurar.
  --  Repositório: https://github.com/stevearc/conform.nvim
  'stevearc/conform.nvim',

  enabled = vim.g.odara.plugins.conform_nvim or false,

  event = { 'BufReadPre', 'BufNewFile' },

  config = function()
    local conform = require('conform')
    local format_opts = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }

    -- Setup {{{

    conform.setup({
      formatters = {
        shfmt = {
          command = 'shfmt',
          args = { '-i', '2', '-ci', '-s' },
          stdin = true,
        },

        systemd_analyze = {
          command = 'systemd-analyze',
          args = { 'verify' },
          stdin = false,
        },

        nginxfmt = {
          command = 'nginxfmt',
          args = { '--indent', '2', vim.fn.expand('%:p') },
          stdin = false,
        },
      },

      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt', 'goimports' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        nginx = { 'nginxfmt' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'yamlfmt' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        python = { 'isort', 'black' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
        systemd = { 'systemd_analyze' },
        php = { 'intelephense' },
        toml = { 'taplo' },
      },

      format_on_save = function(bufnr)
        conform.format(vim.tbl_extend('force', { bufnr = bufnr }, format_opts))
      end,
    })

    -- }}}

    vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
      conform.format(format_opts)
    end, { desc = '[F]ormat [F]ile or Range' })
  end,
}
