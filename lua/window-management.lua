M = {}

-- inspired by the "tall" layout from https://ianyh.com/amethyst/
function M.tall_left()
  -- Save the current buffer id
  local win_id = vim.api.nvim_get_current_win()

  -- Turn all windows into horizontal splits. This will move the cursor into whatever window happens to be at the bottom
  -- after the windows are moved.
  local stack_windows_cmd = "lua vim.cmd('wincmd J')"
  vim.cmd('windo execute("' .. stack_windows_cmd .. '")')

  -- Move the cursor back into the window where it was before the command was executed.
  vim.api.nvim_set_current_win(win_id)

  -- Move the window to the left, which leaves us with an arrangement like this:
  --
  -- ----------------------
  -- | main    | win 2    |
  -- | window  |          |
  -- |         |----------|
  -- |         | win 3    |
  -- |         |          |
  -- ----------------------
  --
  vim.cmd("wincmd H")
end

return M
