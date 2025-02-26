return {
  -- NOTE:   Gerenciador de bookmarks simples e eficiente para Neovim.
  --   Permite salvar, visualizar e navegar rapidamente entre bookmarks.
  --   Suporte a atalhos personalizáveis e integração com Telescope.
  --   Armazena bookmarks em um arquivo, permitindo persistência entre sessões.
  --   Repositório: https://github.com/crusj/bookmarks.nvim
  'crusj/bookmarks.nvim',

  enabled = false,

  dependencies = {
    -- NOTE:  Ícones para arquivos e diretórios no Neovim.
    --  Integra-se com plugins como nvim-tree, telescope e lualine.
    --  Suporte a múltiplos temas e personalização de ícones.
    --  Requer uma fonte Nerd Font para exibição correta.
    --  Repositório: https://github.com/nvim-tree/nvim-web-devicons
    {
      'nvim-tree/nvim-web-devicons',
      enabled = vim.g.odara.plugins.nvim_web_devicons or false,
    },

    -- NOTE:  Fuzzy finder altamente extensível para Neovim.
    --  Busca rápida em arquivos, buffers, LSP, comandos e muito mais.
    --  Integra-se com ripgrep, fd, fzf e plugins externos.
    --  Altamente configurável e personalizável com atalhos e extensões.
    --  Repositório: https://github.com/nvim-telescope/telescope.nvim
    {
      'nvim-telescope/telescope.nvim',
      enabled = vim.g.odara.plugins.telescope_nvim or false,
    },
  },
  config = function()
    require('bookmarks').setup({
      storage_dir = '', -- Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path",
      mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
      keymap = {
        toggle = '<tab><tab>', -- Toggle bookmarks(global keymap)
        close = 'q', -- close bookmarks (buf keymap)
        add = '\\z', -- Add bookmarks(global keymap)
        add_global = '\\g', -- Add global bookmarks(global keymap), global bookmarks will appear in all projects. Identified with the symbol '󰯾'
        jump = '<CR>', -- Jump from bookmarks(buf keymap)
        delete = 'dd', -- Delete bookmarks(buf keymap)
        order = '<space><space>', -- Order bookmarks by frequency or updated_time(buf keymap)
        delete_on_virt = '\\dd', -- Delete bookmark at virt text line(global keymap)
        show_desc = '\\sd', -- show bookmark desc(global keymap)
        focus_tags = '<c-j>', -- focus tags window
        focus_bookmarks = '<c-k>', -- focus bookmarks window
        toogle_focus = '<S-Tab>', -- toggle window focus (tags-window <-> bookmarks-window)
      },
      width = 0.8, -- Bookmarks window width:  (0, 1]
      height = 0.7, -- Bookmarks window height: (0, 1]
      preview_ratio = 0.45, -- Bookmarks preview window ratio (0, 1]
      tags_ratio = 0.1, -- Bookmarks tags window ratio
      fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

      virt_text = '', -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.
      sign_icon = '󰃃', -- if it is not empty, show icon in signColumn.
      virt_pattern = { '*.go', '*.lua', '*.sh', '*.php', '*.rs' }, -- Show virt text only on matched pattern
      virt_ignore_pattern = {}, -- Ignore showing virt text on matched pattern, this works after virt_pattern
      border_style = 'single', -- border style: "single", "double", "rounded"
      hl = {
        border = 'TelescopeBorder', -- border highlight
        cursorline = 'guibg=Gray guifg=White', -- cursorline highlight
      },
      datetime_format = '%Y-%m-%d %H:%M:%S', -- os.date
      -- •	%Y: Four-digit year
      -- •	%m: Two-digit month (01 to 12)
      -- •	%d: Two-digit day (01 to 31)
      -- •	%H: Hour in 24-hour format (00 to 23)
      -- •	%I: Hour in 12-hour format (01 to 12)
      -- •	%M: Two-digit minute (00 to 59)
      -- •	%S: Two-digit second (00 to 59)
      -- •	%p: AM/PM indicator

      sign_priority = 8, -- Prioridade do ícone
      save_file = vim.fn.stdpath('data') .. '/bookmarks', -- Caminho para salvar os bookmarks
    })

    if vim.g.odara.plugins.telescope_nvim then
      local telescope = require('telescope')

      telescope.load_extension('bookmarks')
    end
  end,
}
