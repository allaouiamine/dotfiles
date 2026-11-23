-- Keep noice's `mini` view off the row above the global statusline (laststatus=3),
-- where it overlays the bottom of the claudecode.nvim split and hides Claude's
-- input box / plan-mode indicator.
return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- LazyVim already populates opts.routes (lazyvim/plugins/ui.lua:206-218).
      -- `routes` is a list, and lazy.nvim's deep-extend replaces lists rather
      -- than appending, so the function form is required: a table-form `opts`
      -- would silently delete LazyVim's own route.
      opts.routes = opts.routes or {}

      -- Drop the gopls workspace-load error whichever route it arrives by. A
      -- filter carrying only `find` is not coupled to event/kind
      -- (noice/message/filter.lua:94), and `skip` both discards the message and
      -- breaks route evaluation (noice/message/router.lua:196-206). Custom
      -- routes are prepended ahead of every default
      -- (noice/config/routes.lua:8-19), so these win over the built-ins.
      -- `find` is a Lua pattern, hence the escaped dots.
      for _, pattern in ipairs({
        "modules have errors",
        "annotations%.pb%.go",
      }) do
        table.insert(opts.routes, { filter = { find = pattern }, opts = { skip = true } })
      end

      -- Send LSP progress to the Snacks notifier (top-right) instead of `mini`,
      -- so nothing ever occupies the row above the statusline.
      --
      -- `replace = true` is load-bearing: noice re-pushes a live progress
      -- message every lsp.progress.throttle (100ms) tick, and the snacks
      -- backend only reuses its notification id when `replace` is set
      -- (noice/view/backend/snacks.lua:79). Without it, a token that never
      -- sends kind="end" spawns a brand-new notification 10x per second.
      --
      -- Passing these as *route* opts also gives progress its own cached view
      -- instance (noice/view/init.lua:54 keys the cache on opts equality, and
      -- the snacks backend leaves `_instance = "opts"`), so the shared `notify`
      -- view used by errors and warnings keeps its default stacking behaviour.
      table.insert(opts.routes, {
        view = "notify",
        filter = { event = "lsp", kind = "progress" },
        opts = { replace = true, merge = true, title = "LSP Progress" },
      })

      return opts
    end,
  },
}
