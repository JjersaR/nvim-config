add('folke/snacks.nvim')

later(function()
  require('snacks').setup({
    dashboard = {
      enabled = false,
      preset = {
        header = [[
           _
          | |
 ___  __ _| |_ _   _ _ __ _ __
/ __|/ _` | __| | | | '__| '_ \
\__ \ (_| | |_| |_| | |  | | | |
|___/\__,_|\__|\__,_|_|  |_| |_|
        ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "t", desc = "File Explorer", action = ":lua MiniFiles.open()" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", action = ":lua MiniSessions.read('Session.vim')" },
          { icon = "󰒲 ", key = "D", desc = "Deps", action = ":lua MiniDeps.update()" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = vim.fn.isdirectory(".git") == 1,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    picker = {
      layout = {
        fullscreen = false,
      },
      source = {
        files = {
          exclude = {
            "*.class",
          },
        },
      },
    },
    bigfile = { enabled = false },
    bufdelete = { enabled = false },
    notifier = { enabled = false },
    debug = { enabled = false },
    git = { enabled = false },
    gitbrowse = { enabled = false },
    lazygit = { enabled = false },
    notify = { enabled = false },
    quickfile = { enabled = false },
    rename = { enabled = false },
    statuscolumn = { enabled = false },
    terminal = { enabled = false },
    toggle = { enabled = false },
    win = { enabled = false },
    words = { enabled = false },
  })


  local map = vim.keymap.set
  local opts = { silent = true }

  -- Top Pickers & Explorer
  map("n", "<leader><space>", function() Snacks.picker.smart() end, vim.tbl_extend("force", opts, { desc = "Smart Find Files" }))
  map("n", "<leader>,", function() Snacks.picker.buffers() end, vim.tbl_extend("force", opts, { desc = "Buffers" }))
  map("n", "<leader>/", function() Snacks.picker.grep() end, vim.tbl_extend("force", opts, { desc = "Grep" }))
  map("n", "<leader>:", function() Snacks.picker.command_history() end, vim.tbl_extend("force", opts, { desc = "Command History" }))
  map("n", "<leader>n", function() Snacks.picker.notifications() end, vim.tbl_extend("force", opts, { desc = "Notification History" }))

  -- Find
  map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
  map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
  map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
  map("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
  map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent Files" })

  -- Git
  map("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
  map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
  map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
  map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
  map("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
  map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
  map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

  -- GitHub
  map("n", "<leader>gi", function() Snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" })
  map("n", "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" })
  map("n", "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub PRs (open)" })
  map("n", "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, { desc = "GitHub PRs (all)" })

  -- Grep
  map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
  map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
  map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

  -- Search
  map("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
  map("n", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
  map("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
  map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
  map("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
  map("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
  map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
  map("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
  map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
  map("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
  map("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
  map("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
  map("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
  map("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
  map("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
  map("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
  map("n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
  map("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
  map("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
  map("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })

end)


