local M = {}

function M.fix_php_indent(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  if not lines[1]:match('^<%?php%s*$') then
    return
  end

  for i = 2, #lines do
    if lines[i] ~= '' then
      lines[i] = '    ' .. lines[i]
    end
  end

  if #lines > 0 and lines[#lines] ~= '' then
    table.insert(lines, '')
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  print('Indentação extra aplicada ao PHP.')
end

return M
