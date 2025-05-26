NAME = "command-aliases"

local M = {}

-- SOURCE: https://stackoverflow.com/a/69951171
function _G.abbreviate_or_noop(input, output)
  local cmdtype = vim.fn.getcmdtype()
  local cmdline = vim.fn.getcmdline()

  if (cmdtype == ":" and cmdline == input) then
    return output
  else
    return input
  end
end
-- /SOURCE

local function SetupAlias(input, output)
  vim.api.nvim_command("cabbrev <expr> " ..
    input .. " " .. "v:lua.abbreviate_or_noop('" .. input .. "', '" .. output .. "')")
end

M.setup_alias = SetupAlias

return M
