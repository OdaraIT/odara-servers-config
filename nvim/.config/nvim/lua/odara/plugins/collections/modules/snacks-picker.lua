return {
  -- NOTE:   Módulo Picker para seleção interativa no Neovim.
  --   Permite criar menus de seleção e listas interativas.
  --   Suporte a atalhos, filtros e integração com outros plugins.
  --   Configurável para diferentes estilos de exibição e interação.
  --   Documentação: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md

  enabled = vim.g.odara.plugins.snacks_nvim.picker or false,

  sources = {
    explorer = require('odara.plugins.collections.modules.snacks-picker-explorer'),
  },
}
