return {
  -- NOTE:  Depurador assíncrono para Neovim.
  --  Suporte para depuração de várias linguagens via adaptadores DAP.
  --  Permite adicionar breakpoints, inspecionar variáveis e controlar a execução do código.
  --  Altamente configurável e extensível com integrações como nvim-dap-ui.
  --  Repositório: https://github.com/mfussenegger/nvim-dap
  'mfussenegger/nvim-dap',

  enabled = vim.g.odara.plugins.nvim_dap
    and vim.g.odara.plugins.nvim_dap_ui
    and vim.g.odara.plugins.nvim_nio
    and vim.g.odara.plugins.nvim_dap_virtual_text
    and vim.g.odara.plugins.telescope_dap_nvim
    and vim.g.odara.plugins.mason_nvim
    and vim.g.odara.plugins.mason_nvim_dap_nvim,

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

    -- NOTE:  Integração do DAP (Debug Adapter Protocol) com Telescope.
    --  Facilita a navegação por breakpoints, frames, threads e variáveis.
    --  Melhora o fluxo de depuração com buscas rápidas e eficientes.
    --  Configurável, suportando filtros e atalhos personalizados.
    --  Repositório: https://github.com/nvim-telescope/telescope-dap.nvim
    {
      'nvim-telescope/telescope-dap.nvim',
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
      cond = vim.g.odara.global.languages.go.enabled and vim.g.odara.global.languages.go.delve,
    },
  },

  -- }}}

  -- Config {{{

  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local mason = require('mason-nvim-dap')

    require('telescope').load_extension('dap')

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

    -- Keybindings {{{
    local wk = require('which-key')
    local dap_telescope = require('telescope').extensions.dap

    wk.add({
      { '<leader>d', group = 'Debugging (DAP)', icon = '' },

      -- Execução e Controle do Debugger
      {
        '<F5>',
        dap.continue,
        desc = 'Debug: Start/Continue',
        icon = { color = 'blue', icon = '' },
      },
      {
        '<F1>',
        dap.step_into,
        desc = 'Debug: Step Into',
        icon = { color = 'yellow', icon = '󰆹' },
      },
      {
        '<F2>',
        dap.step_over,
        desc = 'Debug: Step Over',
        icon = { color = 'yellow', icon = '' },
      },
      {
        '<F3>',
        dap.step_out,
        desc = 'Debug: Step Out',
        icon = { color = 'yellow', icon = '󰆸' },
      },
      {
        '<F4>',
        dap.terminate,
        desc = 'Debug: Stop Debugging',
        icon = { color = 'red', icon = '󰅖' },
      },

      -- UI do Debugger
      {
        '<F7>',
        dapui.toggle,
        desc = 'Debug: Toggle UI',
        icon = { color = 'blue', icon = '󰍰' },
      },
      {
        '<F8>',
        dapui.eval,
        desc = 'Debug: Evaluate Expression',
        icon = { color = 'cyan', icon = '' },
      },

      -- Breakpoints e Configuração
      {
        '<leader>db',
        dap.toggle_breakpoint,
        desc = '[D]ebug: Toggle [B]reakpoint',
        icon = { color = 'red', icon = '' },
      },
      {
        '<leader>dB',
        function()
          dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = '[D]ebug: Set Conditional [B]reakpoint',
        icon = { color = 'red', icon = '󰿁' },
      },

      -- Controle da Sessão de Debugging
      {
        '<leader>dr',
        dap.restart,
        desc = '[D]ebug: [R]estart',
        icon = { color = 'orange', icon = '󰜉' },
      },
      {
        '<leader>dq',
        dap.terminate,
        desc = '[D]ebug: [Q]uit',
        icon = { color = 'red', icon = '󰅖' },
      },
      {
        '<leader>de',
        dapui.eval,
        desc = '[D]ebug: [E]valuate Expression',
        icon = { color = 'cyan', icon = '' },
      },
      {
        '<leader>du',
        dapui.toggle,
        desc = '[D]ebug: Toggle [U]I',
        icon = { color = 'blue', icon = '󰍰' },
      },

      -- 🔍 Integração com Telescope
      {
        '<leader>ds',
        dap_telescope.commands,
        desc = '[D]ebug: [S]how Available Commands',
        icon = { color = 'cyan', icon = '' },
      },
      {
        '<leader>dl',
        dap_telescope.list_breakpoints,
        desc = '[D]ebug: [L]ist Breakpoints',
        icon = { color = 'yellow', icon = '󰯆' },
      },
      {
        '<leader>dv',
        dap_telescope.variables,
        desc = '[D]ebug: Show [V]ariables',
        icon = { color = 'blue', icon = '' },
      },
      {
        '<leader>df',
        dap_telescope.frames,
        desc = '[D]ebug: Show Stack [F]rames',
        icon = { color = 'purple', icon = '󰫑' },
      },
    })
    -- }}}
  end,

  -- }}}
}
