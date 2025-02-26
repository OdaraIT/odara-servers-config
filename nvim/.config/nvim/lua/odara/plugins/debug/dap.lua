return {
  -- NOTE:  Depurador assíncrono para Neovim.
  --  Suporte para depuração de várias linguagens via adaptadores DAP.
  --  Permite adicionar breakpoints, inspecionar variáveis e controlar a execução do código.
  --  Altamente configurável e extensível com integrações como nvim-dap-ui.
  --  Repositório: https://github.com/mfussenegger/nvim-dap
  'mfussenegger/nvim-dap',

  enabled = vim.g.odara.plugins.mason_nvim and vim.g.odara.plugins.nvim_dap,

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
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    require('mason-nvim-dap').setup({
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
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

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup({
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has('win32') == 0,
      },
    })
  end,
}

