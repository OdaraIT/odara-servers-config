return {
  -- NOTE:  Depurador assíncrono para Neovim.
  --  Suporte para depuração de várias linguagens via adaptadores DAP.
  --  Permite adicionar breakpoints, inspecionar variáveis e controlar a execução do código.
  --  Altamente configurável e extensível com integrações como nvim-dap-ui.
  --  Repositório: https://github.com/mfussenegger/nvim-dap
  'mfussenegger/nvim-dap',

  enabled = vim.g.odara.plugins.mason_nvim and vim.g.odara.plugins.nvim_dap,

  -- Dependencies {{{

  dependencies = {
    -- NOTE:  Interface gráfica para nvim-dap no Neovim.
    --  Exibe variáveis, breakpoints, pilha de chamadas e consoles de depuração.
    --  Facilita a interação com o depurador através de janelas flutuantes e painéis.
    --  Requer nvim-dap para funcionar corretamente.
    --  Repositório: https://github.com/rcarriga/nvim-dap-ui
    {
      'rcarriga/nvim-dap-ui',
      enabled = true,
    },

    -- NOTE:  Biblioteca assíncrona para Neovim em Lua.
    --  Fornece uma API para manipulação de eventos assíncronos e IO.
    --  Utilizada internamente por plugins como neotest.
    --  Ajuda no desenvolvimento de plugins com melhor gerenciamento de concorrência.
    --  Repositório: https://github.com/nvim-neotest/nvim-nio
    {
      'nvim-neotest/nvim-nio',
      enabled = true,
    },

    {
      -- NOTE:  Exibe variáveis e expressões diretamente no código durante a depuração.
      --  Integração com nvim-dap para mostrar valores inline.
      --  Atualização em tempo real conforme a execução do código avança.
      --  Requer nvim-dap e nvim-treesitter para funcionar corretamente.
      --  Repositório: https://github.com/theHamsta/nvim-dap-virtual-text
      'theHamsta/nvim-dap-virtual-text',
      enabled = true,
    },

    -- NOTE:  Gerencia a instalação de LSPs, DAPs, linters e formatters no Neovim.
    --  Fornece uma interface simples para instalar e atualizar ferramentas externas.
    --  Integra-se com lspconfig e null-ls para configuração automática.
    --  Repositório: https://github.com/williamboman/mason.nvim
    {
      'williamboman/mason.nvim',
      enabled = true,
    },

    -- NOTE:  Integração entre Mason e nvim-dap no Neovim.
    --  Gerencia automaticamente depuradores para diversas linguagens.
    --  Instala e configura adaptadores DAP via Mason.
    --  Facilita a configuração do nvim-dap sem precisar instalar manualmente os adaptadores.
    --  Repositório: https://github.com/jay-babu/mason-nvim-dap.nvim
    {
      'jay-babu/mason-nvim-dap.nvim',
      enabled = true,
    },

    -- NOTE:  Suporte para depuração de Go no Neovim com nvim-dap.
    --  Configura automaticamente o adaptador DAP para Go (delve).
    --  Permite adicionar breakpoints, inspecionar variáveis e controlar a execução.
    --  Requer nvim-dap e Delve (dlv) instalado no sistema.
    --  Repositório: https://github.com/leoluz/nvim-dap-go
    {
      'leoluz/nvim-dap-go',
      enabled = vim.g.odara.plugins.nvim_dap_go,
    },
  },

  -- }}}

  -- Keybindings {{{

  keys = {
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },

  -- }}}

  -- Config {{{

  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local mason = require('mason-nvim-dap')

    -- DAP {{{

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('odara.plugins.debug.languages.go')
    require('odara.plugins.debug.languages.php')

    -- }}}

    -- DAP UI {{{

    dapui.setup({
      icons = {
        expanded = '▾',
        collapsed = '▸',
        current_frame = '*',
      },

      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    })

    -- }}}

    -- Mason DAP {{{

    mason.setup({
      automatic_installation = true,

      handlers = {},

      ensure_installed = {
        'delve',
        'php-debug-adapter',
      },
    })

    -- }}}
  end,

  -- }}}
}
