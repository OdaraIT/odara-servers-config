vim.filetype.add({
  extension = {
    nginx = 'nginx',
  },

  filename = {
    ['.bashrc'] = 'sh',
    ['.bash_custom'] = 'bash',
    ['.bash_logout'] = 'bash',
    ['.bash_ps1'] = 'bash',
    ['.bash_profile'] = 'bash',
  },
})
