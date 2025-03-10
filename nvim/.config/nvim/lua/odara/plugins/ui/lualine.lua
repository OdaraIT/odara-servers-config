return {
  -- NOTE: 墳 Barra de status altamente customizável para Neovim.
  --  Suporte a separadores, temas e integração com LSP, buffers e git.
  --  Leve e otimizada para desempenho sem comprometer a estética.
  --  Fácil de configurar e compatível com nvim-web-devicons.
  --  Repositório: https://github.com/nvim-lualine/lualine.nvim
  'nvim-lualine/lualine.nvim',

  enabled = vim.g.odara.plugins.lualine_nvim
    and vim.g.odara.plugins.noice_nvim
    and vim.g.odara.plugins.nvim_web_devicons,

  -- Dependencies {{{

  dependencies = {
    -- NOTE:  Ícones para arquivos e diretórios no Neovim.
    --  Integra-se com plugins como nvim-tree, telescope e lualine.
    --  Suporte a múltiplos temas e personalização de ícones.
    --  Requer uma fonte Nerd Font para exibição correta.
    --  Repositório: https://github.com/nvim-tree/nvim-web-devicons
    {
      'nvim-tree/nvim-web-devicons',
      enabled = true,
    },

    -- NOTE:  Tema moderno e vibrante para Neovim com suporte a LSP e Treesitter.
    --  Oferece variações como Night, Storm, Day e Moon.
    --  Integra-se com diversos plugins para uma experiência visual coesa.
    --  Personalizável via configurações para cores e transparência.
    --  Repositório: https://github.com/folke/tokyonight.nvim
    {
      'folke/tokyonight.nvim',
      enabled = vim.g.odara.plugins.tokyonight_nvim,
    },

    -- NOTE:   Tema elegante e altamente personalizável para Neovim.
    --   Fornece paleta suave e consistente para diferentes ambientes.
    --   Suporte nativo para LSP, Treesitter, Telescope e mais.
    --   Variantes de cores configuráveis para diferentes estilos visuais.
    --   Repositório: https://github.com/catppuccin/nvim
    {
      'catppuccin/nvim',
      enabled = vim.g.odara.plugins.catppuccin_nvim,
    },
  },

  -- }}}

  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status')
    local setup = {}
    local lazy_status_color = '#ff9e64'

    if vim.g.odara.plugins.tokyonight_nvim then
      local colors = {
        blue = '#65D1FF',
        green = '#3EFFDC',
        violet = '#FF61EF',
        yellow = '#FFDA7B',
        red = '#FF4A4A',
        fg = '#c3ccdc',
        bg = '#112638',
        inactive_bg = '#2c3043',
      }

      local theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },

        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },

        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },

        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },

        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },

        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
          b = { bg = colors.inactive_bg, fg = colors.semilightgray },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }

      setup.options = {
        theme = theme,
      }
    end

    if vim.g.odara.plugins.catppuccin_nvim then
      lazy_status_color = '#fab387'
    end

    local noice = require('noice')

    setup.sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = {
        {
          noice.api.statusline.mode.get,
          cond = noice.api.statusline.mode.has,
          color = { fg = '#ff9e64' },
        },
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = lazy_status_color },
        },
        'encoding',
        'fileformat',
        {
          'filetype',
          icon = function()
            local ftype = vim.bo.filetype

            if ftype == 'vim' and vim.fn.expand('%:t') == 'vifmrc' then
              return ''
            else
              return require('nvim-web-devicons').get_icon_by_filetype(ftype, { default = true })
            end
          end,
        },
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    }

    lualine.setup(setup)
  end,
}
