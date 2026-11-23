-- Snacks.gitbrowse (used by <leader>gB / <leader>gY) only ships URL patterns for
-- github.com, gitlab.com, bitbucket.org and git.sr.ht. Any other host falls back
-- to the bare repo URL, so file path and line numbers are dropped. Register the
-- self-hosted GitLab here using the same patterns Snacks uses for gitlab.com.
return {
  {
    "folke/snacks.nvim",
    opts = {
      gitbrowse = {
        url_patterns = {
          ["gitlab%.nebius%.dev"] = {
            branch = "/-/tree/{branch}",
            file = "/-/blob/{branch}/{file}#L{line_start}-{line_end}",
            permalink = "/-/blob/{commit}/{file}#L{line_start}-{line_end}",
            commit = "/-/commit/{commit}",
          },
        },
      },
    },
  },
}
