return {
  -- NOTE:  Coleção de configurações prontas para servidores LSP no Neovim.
  --  Facilita a configuração e gerenciamento de LSPs com opções personalizáveis.
  --  Integra-se com mason.nvim para instalação automática de servidores.
  --  Repositório: https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',

  enabled = vim.g.odara.plugins.nvim_lspconfig
    and vim.g.odara.plugins.mason_nvim
    and vim.g.odara.plugins.mason_lspconfig_nvim,

  dependencies = {
    -- NOTE:  Gerencia a instalação de LSPs, DAPs, linters e formatters no Neovim.
    --  Fornece uma interface simples para instalar e atualizar ferramentas externas.
    --  Integra-se com lspconfig e null-ls para configuração automática.
    --  Repositório: https://github.com/williamboman/mason.nvim
    {
      'williamboman/mason.nvim',
      enabled = true,
    },

    -- NOTE:  Integra mason.nvim com lspconfig para configuração automática de LSPs.
    --  Facilita a instalação e ativação de servidores LSP compatíveis.
    --  Garante compatibilidade entre mason.nvim e nvim-lspconfig.
    --  Repositório: https://github.com/williamboman/mason-lspconfig.nvim
    {
      'williamboman/mason-lspconfig.nvim',
      enabled = true,
    },
  },
  config = function()
    local lspconfig = require('lspconfig')

    -- LSP Config {{{

    -- NOTE: LSP servers and clients are able to communicate to each other what features they support.
    -- By default, Neovim doesn't support everything that is in the LSP specification.
    -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    -- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local flags = {
      debounce_text_changes = 150,
    }

    local config = {
      flags = flags,
      capabilities = capabilities,
    }

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = { 'vim' } },
          workspace = { library = vim.api.nvim_get_runtime_file('', true) },
          telemetry = { enable = false },
        },
      },
      flags = flags,
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      cmd = { 'gopls' },
      settings = {
        gopls = {
          usePlaceholders = true,
          staticcheck = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })

    lspconfig.bashls.setup(config)

    lspconfig.cssls.setup(config)

    lspconfig.html.setup(config)

    lspconfig.jsonls.setup(config)

    lspconfig.marksman.setup(config)

    lspconfig.pyright.setup(config)

    lspconfig.ts_ls.setup(config)

    local intelephense_key = os.getenv('ODARA_INTELEPHENSE_KEY') or ''

    lspconfig.intelephense.setup({
      cmd = { 'intelephense', '--stdio' },
      init_options = {
        licenceKey = intelephense_key,
      },
      settings = {
        intelephense = {
          stubs = {
            'bcmath',
            'bz2',
            'Core',
            'curl',
            'date',
            'dom',
            'fileinfo',
            'filter',
            'gd',
            'json',
            'libxml',
            'mbstring',
            'mysqli',
            'openssl',
            'pcntl',
            'pcre',
            'PDO',
            'pdo_mysql',
            'readline',
            'Reflection',
            'session',
            'SimpleXML',
            'sockets',
            'sodium',
            'SPL',
            'standard',
            'tokenizer',
            'xml',
            'zip',
            'zlib',
            'wordpress',
            'woocommerce',
            'phpunit',
            'composer',
          },
          environment = {
            includePaths = { 'vendor' },
          },
          format = {
            enable = true,
          },
          files = {
            maxSize = 5000000,
            exclude = {
              '**/node_modules/**',
              '**/.git/**',
              '**/storage/**',
              '**/cache/**',
              '**/runtime/**',
            },
          },
          diagnostics = {
            enable = true,
          },
          completion = {
            fullyQualifyGlobalConstants = true,
            insertUseDeclaration = true,
            triggerParameterHints = true,
            maxItems = 100,
          },
          indexing = {
            exclude = {
              '**/node_modules/**',
              '**/.git/**',
              '**/storage/**',
              '**/cache/**',
              '**/runtime/**',
            },
          },
        },
      },
      on_attach = function(client, bufnr)
        if client.server_capabilities.codeLensProvider then
          vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
            buffer = bufnr,
            callback = function()
              vim.lsp.codelens.refresh()
            end,
          })
        end
      end,
      flags = flags,
      capabilities = capabilities,
    })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold' }, {
      pattern = '*.php',
      callback = function()
        vim.lsp.codelens.refresh()
      end,
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.php',
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    -- }}}

    -- General Config {{{

    if vim.g.have_nerd_font then
      local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }

      local diagnostic_signs = {}

      for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
      end

      vim.diagnostic.config({
        signs = { text = diagnostic_signs },
        virtual_text = true, -- Desativa os diagnósticos inline
        underline = false, -- Mantém o sublinhado em erros e warnings
        update_in_insert = false, -- Não atualiza diagnósticos enquanto digita
        severity_sort = true, -- Ordena os diagnósticos por severidade
      })
    end

    -- }}}

    -- Keymaps and Client Actions {{{

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('odara-lsp-attach', { clear = true }),
      callback = function(event)
        -- Keymaps {{{

        local builtin = require('telescope.builtin')
        local keymap = require('odara.helpers.telescope.keymap')
        local buffer = event.buffer or nil

        keymap.set_lsp('gd', builtin.lsp_definitions, '[G]oto [D]efinition', buffer)
        keymap.set_lsp('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration', buffer)
        keymap.set_lsp('gr', builtin.lsp_references, '[G]oto [R]eferences', buffer)
        keymap.set_lsp('gI', builtin.lsp_implementations, '[G]oto [I]mplementation', buffer)
        keymap.set_lsp('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition', buffer)
        keymap.set_lsp('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols', buffer)
        keymap.set_lsp('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace Dynamic [S]ymbols', buffer)
        keymap.set_lsp('<leader>Ws', builtin.lsp_workspace_symbols, '[W]orkspace [S]ymbols', buffer)
        keymap.set_lsp('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame', buffer)
        keymap.set_lsp('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', buffer, { 'n', 'x' })

        -- }}}

        -- Client Actions {{{

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client then
          if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('odara-lsp-highlight', { clear = false })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('odara-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = 'odara-lsp-highlight', buffer = event2.buf })
              end,
            })
          end

          client.handlers['textDocument/hover'] = function(_, result, _, _)
            local bufnr, winnr = vim.lsp.util.open_floating_preview(result and result.contents or {}, 'markdown', {
              border = 'rounded',
              focusable = false,
              style = 'minimal',
              relative = 'cursor',
              width = 60,
              max_width = 80,
              max_height = 20,
            })
            if winnr then
              vim.api.nvim_win_set_option(winnr, 'winhighlight', 'Normal:NormalFloat,FloatBorder:FloatBorder')
            end
            return bufnr, winnr
          end

          vim.cmd([[
  hi NormalFloat guibg=#1e1e2e
  hi FloatBorder guibg=#1e1e2e guifg=#89b4fa
]])
        end

        -- }}}
      end,
    })

    -- }}}
  end,
}
