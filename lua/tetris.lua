-- package.path = package.path .. ';' ..
require 'types'
local win_management = require 'window_management'

local M = {}

--- @type tetris.State
local state = {
  window = nil,
}

local present_keymap = function(mode, key, callback)
  if state.window == nil then
    return
  end

  vim.keymap.set(mode, key, callback, {
    buffer = state.window.buf,
  })
end

M.setup = function(opts)
  opts = opts or {}
end

M.start_game = function()
  local window_config = win_management.create_window_configuration()
  state.window = win_management.create_floating_window(window_config, true)

  present_keymap('n', 'q', function()
    if state.window == nil then
      return
    end

    vim.api.nvim_win_close(state.window.win, true)
  end)
end

M.start_game()

return M
