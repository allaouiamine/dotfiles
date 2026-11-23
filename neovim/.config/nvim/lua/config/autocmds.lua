-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- :Nogo [target] -- run the monorepo Go linter (nogo) and load results into quickfix.
-- Defaults to //vpc/... . Blocks while bazel runs (~30s warm, ~100s cold).
vim.api.nvim_create_user_command("Nogo", function(o)
  local root = vim.fn.expand("~/nebo")
  local target = o.args ~= "" and o.args or "//vpc/..."
  -- keep only indented "path:line:col: msg" lines; drop headers and patch paths
  local cmd = ("cd %s && ./bazel run //:nogo -- run %s 2>/dev/null"
    .. " | sed -n 's|^    \\(.*:[0-9][0-9]*:[0-9][0-9]*: .*\\)$|%s/\\1|p'")
    :format(vim.fn.shellescape(root, true), target, root)

  vim.notify("nogo: linting " .. target .. " ...", vim.log.levels.INFO)
  local lines = vim.fn.systemlist(cmd)

  vim.fn.setqflist({}, " ", {
    title = "nogo " .. target,
    lines = lines,
    efm = "%f:%l:%c: %m",
  })

  local n = #vim.fn.getqflist()
  if n == 0 then
    vim.notify("nogo: no violations", vim.log.levels.INFO)
  else
    vim.notify(("nogo: %d violations"):format(n), vim.log.levels.WARN)
    vim.cmd("botright copen")
  end
end, { nargs = "?", desc = "Run nogo linter into quickfix" })
