local go = require('dap-go')

go.setup({
  delve = {
    detached = vim.fn.has('win32') == 0,
  },
})
