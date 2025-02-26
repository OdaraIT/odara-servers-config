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
      },

      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt', 'goimports' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'yamlfmt' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        python = { 'isort', 'black' },
        sh = { 'shfmt' },
        zsh = { 'shfmt' },
        systemd = { 'systemd_analyze' },
        php = { 'php_cs_fixer' },
        toml = { 'taplo' },
        http = { 'jq' },
      },

      format_on_save = function(bufnr)
        conform.format(vim.tbl_extend('force', { bufnr = bufnr }, format_opts))

        -- if vim.bo[bufnr].filetype == 'php' then
        --   require('odara.core.helpers.formatters-php-fix-indent').fix_php_indent(bufnr)
        -- end
      end,
    })

    -- }}}

    vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
      conform.format(format_opts)
    end, { desc = '[F]ormat [F]ile or Range' })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.sh', '*.zsh' },
      callback = function()
        require('conform').format()
      end,
    })
  end,
}
