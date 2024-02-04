vim.cmd("command R terminal 'R'")
vim.cmd("command Python terminal 'python'")
vim.cmd("command RScript tabe | terminal Rscript %")
vim.cmd("command VR botright vsplit | terminal 'R'")
vim.cmd("command QuartoCheck tabe | terminal quarto check")
vim.cmd("command QuartoRenderFile tabe %| terminal quarto render %")
vim.cmd("command QuartoRenderProject tabe %| terminal quarto render ./")
vim.cmd("command QuartoPreviewProject  tabe %| terminal quarto preview ./")
vim.cmd("command QuartoPreviewFile  tabe %| terminal quarto preview %")
vim.cmd("command ShowSpaceTable !column -s ' ' -t  < %")
vim.cmd("command ShowTabTable !column -s '\t' -t  < %")
vim.cmd("command ShowMarkDown !viewmd %")
vim.cmd("command GitHubPush !githubinit && git push")
vim.cmd("command GitHubPull !githubinit && git pull")
vim.cmd("command RunApp tabe % | terminal R --slave -e \"shiny::runApp(launch.browser = TRUE)\"")
vim.cmd("command BufferDeleteAll %bd|e#")
vim.cmd("command CleanWorkoutLog %s/\\d\\(\\.\\d\\|\\)$//")
 
function daily(path, extension)
    local daily = os.date('%Y-%m-%d') .. extension
    vim.cmd(':e ' .. path .. daily)
end

function weekly(path, extension)
    local weekly = os.date('%Y-%W') .. extension
    vim.cmd(':e ' .. path .. weekly)
end

vim.api.nvim_create_user_command(
  'DailyJournal',
  "lua daily('~/zettelkasten/journal/daily/', '.md')",
  {}
)

vim.api.nvim_create_user_command(
  'DailyWorkout',
  "lua daily('~/zettelkasten/workout-log/powerlifting/004_cycle/', '.tsv')",
  {}
)

vim.api.nvim_create_user_command(
  'WeeklyReview',
  "lua weekly('~/zettelkasten/journal/weekly/', '.md')",
  {}
)


function r_pipe()
  pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1]
  local col = pos[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, col) .. '|>' .. line:sub(col + 1)
  vim.api.nvim_set_current_line(nline)
  new_pos = {row, col + 2}
  vim.api.nvim_win_set_cursor(0, new_pos)
end

function r_in()
  pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1]
  local col = pos[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, col) .. '%in%' .. line:sub(col + 1)
  vim.api.nvim_set_current_line(nline)
  new_pos = {row, col + 4}
  vim.api.nvim_win_set_cursor(0, new_pos)
end


function r_arrow()
  pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1]
  local col = pos[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, col) .. '<-' .. line:sub(col + 1)
  vim.api.nvim_set_current_line(nline)
  new_pos = {row, col + 2}
  vim.api.nvim_win_set_cursor(0, new_pos)
end
