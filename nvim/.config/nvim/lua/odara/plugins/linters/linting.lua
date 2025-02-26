return {
  -- NOTE:  Executa linters assíncronos no Neovim sem necessidade de LSP.
  --  Suporte a múltiplos linters e configuração por arquivo ou global.
  --  Integra-se com autocmds para linting automático ao salvar arquivos.
  --  Extensível e compatível com diversas linguagens.
  --  Repositório: https://github.com/mfussenegger/nvim-lint
  'mfussenegger/nvim-lint',

  enabled = vim.g.odara.plugins.nvim_lint or false,

  event = { 'BufReadPre', 'BufNewFile' },

  config = function()
    local lint = require('lint')

    -- Available Linters {{{

    lint.linters_by_ft = {
      -- go = { 'golangci-lint' },
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      svelte = { 'eslint_d' },
      python = { 'pylint' },
      php = { 'phpstan', 'phpcs', 'phpmd' },
    }

    -- }}}

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- PHP Linters {{{

    -- Configuração do PHPStan {{{

    lint.linters.phpstan = {
      name = 'PHPStan',
      cmd = 'phpstan',
      stdin = false,
      args = {
        'analyse',
        '--error-format=json',
        '--level=max',
        '--no-progress',
        '--no-interaction',
        vim.fn.expand('%:p'),
      },
      ignore_exitcode = true,
      parser = function(output, bufnr)
        if output == nil or output == '' then
          return {}
        end

        local decoded = vim.fn.json_decode(output)

        if not decoded or not decoded.files then
          return {}
        end

        local diagnostics = {}

        for _, file in pairs(decoded.files) do
          for _, message in ipairs(file.messages) do
            local severity = vim.diagnostic.severity.WARN

            if message.message:match('error') then
              severity = vim.diagnostic.severity.ERROR
            elseif message.message:match('deprecated') then
              severity = vim.diagnostic.severity.WARN
            elseif message.message:match('notice') or message.message:match('info') then
              severity = vim.diagnostic.severity.INFO
            end

            table.insert(diagnostics, {
              bufnr = bufnr,
              lnum = message.line - 1,
              col = 0,
              message = '[PHPStan] ' .. message.message,
              severity = severity,
              source = 'phpstan',
            })
          end
        end

        return diagnostics
      end,
    }

    -- }}}

    -- Configuração do PHPCS (PSR-12) {{{

    lint.linters.phpcs = {
      name = 'PHPCS',
      cmd = 'phpcs',
      stdin = false,
      args = { '--standard=PSR12', '--report=json', vim.fn.expand('%:p') },
      ignore_exitcode = true,
      parser = function(output, bufnr)
        local decoded = vim.fn.json_decode(output)
        local diagnostics = {}

        if decoded and decoded.files then
          for _, file in pairs(decoded.files) do
            for _, message in ipairs(file.messages) do
              table.insert(diagnostics, {
                bufnr = bufnr,
                lnum = message.line - 1,
                col = message.column - 1,
                message = '[PHPCS] ' .. message.message,
                severity = message.type == 'ERROR' and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
                source = 'phpcs',
              })
            end
          end
        end

        return diagnostics
      end,
    }

    -- }}}

    -- Configuração do PHP-MD (Code Smells) {{{

    lint.linters.phpmd = {
      name = 'PHPMD',
      cmd = 'phpmd',
      stdin = false,
      args = { '-', 'json', 'cleancode,codesize,unusedcode' },
      ignore_exitcode = true,
      parser = function(output, bufnr)
        local decoded = vim.fn.json_decode(output)
        local diagnostics = {}

        if decoded and decoded.violations then
          for _, violation in ipairs(decoded.violations) do
            table.insert(diagnostics, {
              bufnr = bufnr,
              lnum = violation.beginLine - 1,
              col = 0,
              message = '[PHP-MD] ' .. violation.description,
              severity = vim.diagnostic.severity.WARN,
              source = 'phpmd',
            })
          end
        end

        return diagnostics
      end,
    }

    -- }}}

    -- }}}

    -- Keymaps {{{

    vim.keymap.set('n', '<leader>lf', function()
      lint.try_lint()
    end, { desc = 'Trigger [L]inting for Current [F]ile' })

    vim.g.linting_enabled = true

    vim.keymap.set('n', '<leader>lt', function()
      if vim.g.linting_enabled then
        vim.diagnostic.enable(false)
        vim.g.linting_enabled = false

        print('Linting disabled.')
      else
        vim.diagnostic.enable()
        vim.g.linting_enabled = true

        print('Linting enabled.')
      end
    end, { desc = '[L]inting: [T]oogle Diagnostics' })

    -- }}}
  end,
}
