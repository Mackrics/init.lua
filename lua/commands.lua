vim.cmd("command R terminal 'R'")
vim.cmd("command Python terminal 'python'")
vim.cmd("command RScript tabe | terminal Rscript %")
vim.cmd("command VR botright vsplit | terminal 'R'")
vim.cmd("command QuartoCheck tabe | terminal quarto check")
vim.cmd("command QuartoRenderFile tabe %| terminal quarto render %")
vim.cmd("command QuartoRenderProject tabe %| terminal quarto render ./")
vim.cmd("command QuartoPreviewProject  tabe %| terminal quarto preview ./")
vim.cmd("command QuartoPreviewFile  tabe %| terminal quarto preview %")
vim.cmd("command CargoRun !cargo run")
vim.cmd("command CargoBuild !cargo build")
vim.cmd("command GoRun !go run .")
vim.cmd("command GoBuild !go build .")
vim.cmd("command GitHubPush !githubinit && git push")
vim.cmd("command GitHubPull !githubinit && git pull")
vim.cmd("command RunApp tabe % | terminal R --slave -e \"shiny::runApp(launch.browser = TRUE)\"")
vim.cmd("command LitedownFuseSite tabe % | terminal R --slave -e \"litedown::fuse_site()\"")
vim.cmd("command LitedownMark tabe % | terminal R --slave -e \"litedown::mark('%')\"")
vim.cmd("command TypstCompile tabe % | terminal typst compile %")
vim.cmd("command TypstWatch tabe % | terminal typst watch %")
vim.cmd("command BufferDeleteAll %bd|e#")
vim.cmd("command CleanWorkoutLog %s/\\d\\(\\.\\d\\|\\)$//")
vim.cmd("command AirFormat !/home/mackrics/git-repos/air/target/debug/./air format %")
 
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
  "lua daily('~/zettelkasten/workout-log/powerlifting/005_cycle/', '.tsv')",
  {}
)

vim.api.nvim_create_user_command(
  'WeeklyReview',
  "lua weekly('~/zettelkasten/journal/weekly/', '.md')",
  {}
)

function create_macro(text)
  pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1]
  local col = pos[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, col) .. text .. line:sub(col + 1)
  length = string.len(text)
  vim.api.nvim_set_current_line(nline)
  new_pos = {row, col + length}
  vim.api.nvim_win_set_cursor(0, new_pos)
end

function qmd_bullet()
  create_macro('(@) ')
end

function r_pipe()
  create_macro('|>')
end

function r_in()
  create_macro('%in% ')
end

function r_arrow()
  create_macro('<-')
end

function r_dt()
  create_macro('_[]')
end
