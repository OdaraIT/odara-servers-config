return {
  'danymat/neogen',
  enabled = true,
  config = function()
    require('neogen').setup({
      enabled = true,
      languages = {
        lua = { template = { annotation_convention = 'ldoc' } },
      },
    })
  end,
}
