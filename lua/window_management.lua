require 'types'

local window_management = {}

--- @return tetris.Window
local function create_floating_window(config, enter)
  if enter == nil then
    enter = false
  end

  -- Create a buffer
  local buf = vim.api.nvim_create_buf(false, true)

  local win = vim.api.nvim_open_win(buf, enter or false, config)

  return { buf = buf, win = win }
end

local create_window_configuration = function()
  -- local width = vim.o.columns
  local width = 50
  local height = 40

  local body_height = height - 2 - 1

  local center_vertical_offset = 10
  local center_col = (vim.o.columns / 2) - (width / 2)
  local center_row = (vim.o.lines / 2) - (height / 2) - center_vertical_offset

  return {
    relative = 'editor',
    width = width - 8,
    height = body_height,
    style = 'minimal',
    border = 'rounded',
    col = center_col,
    row = center_row,
  }
end

window_management.create_floating_window = create_floating_window
window_management.create_window_configuration = create_window_configuration

return window_management
