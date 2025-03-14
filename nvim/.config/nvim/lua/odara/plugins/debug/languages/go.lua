if vim.g.odara.global.languages.go.enabled and vim.g.odara.global.languages.go.delve then
  local go = require('dap-go')

  go.setup({
    delve = {
      detached = vim.fn.has('win32') == 0,
    },
  })
end
