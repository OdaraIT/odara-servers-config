return {
  -- NOTE:   Conjunto de helpers para manipulação de strings, tabelas e padrões no Neovim.
  --   Fornece funções utilitárias para facilitar o desenvolvimento em Lua.
  --   Projetado para ser leve e sem dependências externas.
  --   Integra-se facilmente com outros plugins e scripts personalizados.
  --   Repositório: https://github.com/folke/snacks.nvim
  'folke/snacks.nvim',

  enabled = true,

  priority = 1000,

  lazy = false,

  config = function()
    local snacks = require('snacks')
    local settings = {}

    -- NOTE:   Módulo Explorer para navegação e visualização no Neovim.
    --   Fornece uma interface interativa para explorar dados e estruturas.
    --   Suporte a expansão de nós, atalhos e navegação intuitiva.
    --   Configurável para diferentes tipos de dados e visualizações.
    --   Documentação: https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md
    settings.explorer = require('odara.plugins.collections.modules.snacks-explorer')

    -- NOTE:   Módulo Picker para seleção interativa no Neovim.
    --   Permite criar menus de seleção e listas interativas.
    --   Suporte a atalhos, filtros e integração com outros plugins.
    --   Configurável para diferentes estilos de exibição e interação.
    --   Documentação: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    settings.picker = require('odara.plugins.collections.modules.snacks-picker')

    settings.animate = { enabled = vim.g.odara.plugins.snacks_nvim.animate or false }
    settings.bigfile = { enabled = vim.g.odara.plugins.snacks_nvim.bigfile or false }
    settings.bufdelete = { enabled = vim.g.odara.plugins.snacks_nvim.bufdelete or false }
    settings.dashboard = { enabled = vim.g.odara.plugins.snacks_nvim.dashboard or false }
    settings.debug = { enabled = vim.g.odara.plugins.snacks_nvim.debug or false }
    settings.dim = { enabled = vim.g.odara.plugins.snacks_nvim.dim or false }
    settings.git = { enabled = vim.g.odara.plugins.snacks_nvim.git or false }
    settings.gitbrowse = { enabled = vim.g.odara.plugins.snacks_nvim.gitbrowse or false }
    settings.image = { enabled = vim.g.odara.plugins.snacks_nvim.image or false }
    settings.indent = { enabled = vim.g.odara.plugins.snacks_nvim.indent or false }
    settings.input = { enabled = vim.g.odara.plugins.snacks_nvim.input or false }
    settings.layout = { enabled = vim.g.odara.plugins.snacks_nvim.layout or false }
    settings.lazygit = { enabled = vim.g.odara.plugins.snacks_nvim.lazygit or false }
    settings.notifier = { enabled = vim.g.odara.plugins.snacks_nvim.notifier or false }
    settings.notify = { enabled = vim.g.odara.plugins.snacks_nvim.notify or false }
    settings.profiler = { enabled = vim.g.odara.plugins.snacks_nvim.profiler or false }
    settings.quickfile = { enabled = vim.g.odara.plugins.snacks_nvim.quickfile or false }
    settings.rename = { enabled = vim.g.odara.plugins.snacks_nvim.rename or false }
    settings.scope = { enabled = vim.g.odara.plugins.snacks_nvim.scope or false }
    settings.scratch = { enabled = vim.g.odara.plugins.snacks_nvim.scratch or false }
    settings.scroll = { enabled = vim.g.odara.plugins.snacks_nvim.scroll or false }
    settings.statuscolumn = { enabled = vim.g.odara.plugins.snacks_nvim.statuscolumn or false }
    settings.terminal = { enabled = vim.g.odara.plugins.snacks_nvim.terminal or false }
    settings.toggle = { enabled = vim.g.odara.plugins.snacks_nvim.toggle or false }
    settings.util = { enabled = vim.g.odara.plugins.snacks_nvim.util or false }
    settings.win = { enabled = vim.g.odara.plugins.snacks_nvim.win or false }
    settings.words = { enabled = vim.g.odara.plugins.snacks_nvim.words or false }
    settings.zen = { enabled = vim.g.odara.plugins.snacks_nvim.zen or false }

    snacks.setup(settings)
  end,
}
