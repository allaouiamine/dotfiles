-- Go-to-definition into the TeamCity Kotlin DSL.
--
-- kotlin-language-server only returns a definition location for source files it has
-- indexed; for a symbol that lives in a dependency jar it returns nothing, so `gd` on
-- DSL types like Project or BuildType does nothing. Adding the extracted DSL sources as
-- a second workspace folder makes those declarations reachable as ordinary source files.
--
-- Populate/refresh that directory with: refresh-teamcity-dsl-sources
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          before_init = function(params, config)
            local sources = vim.fn.expand("~/.cache/teamcity-dsl-sources")
            if vim.fn.isdirectory(sources) == 0 then
              return
            end
            local folder = { uri = vim.uri_from_fname(sources), name = "teamcity-dsl-sources" }
            params.workspaceFolders = params.workspaceFolders or {}
            table.insert(params.workspaceFolders, folder)
            config.workspace_folders = config.workspace_folders or {}
            table.insert(config.workspace_folders, folder)
          end,
        },
      },
    },
  },
}
