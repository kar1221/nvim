local M = {}

M.cmd = function(c)
  return function()
    vim.cmd(c)
  end
end

return M
