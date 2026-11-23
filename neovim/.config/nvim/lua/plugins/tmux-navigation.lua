return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Go to left pane" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Go to lower pane" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Go to upper pane" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Go to right pane" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Go to previous pane" },
    },
  },
}
