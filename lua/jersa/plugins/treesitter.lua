return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
          "nvim-treesitter/playground", -- View treesitter information directly in Neovim
          "andymass/vim-matchup",
          "nvim-treesitter/nvim-treesitter-refactor",
          "nvim-treesitter/nvim-treesitter-textobjects",
          "hiphish/rainbow-delimiters.nvim",
        },
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                -- enable indentation
                indent = { enable = true },

                -- ensure these languages parsers are installed
                ensure_installed = {
                    "json",
                    "javascript",
                    "typescript",
                    "tsx",
                    "html",
                    "css",
                    "http",
                    "graphql",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "vimdoc",
                    "cpp",
                    "java",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                    },
                },
                additional_vim_regex_highlighting = false,
                rainbow = {
                  enable = true,
                },
                textobjects = {
                  select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                      ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a argument/parameter" },
                      ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a argument/parameter" },
                      ["ab"] = { query = "@block.outer", desc = "Select outer part of a block" },
                      ["ib"] = { query = "@block.inner", desc = "Select inner part of a block" },
                      ["am"] = { query = "@function.outer", desc = "Select outer part of a method" },
                      ["im"] = { query = "@function.inner", desc = "Select inner part of a method" },
                      ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                      ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                      ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
                      ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                      ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
                    },
                  },
                  move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                      ["]m"] = { query = "@function.outer", desc = "Next method start" },
                      ["]c"] = { query = "@class.outer", desc = "Next class start" },
                      ["]a"] = { query = "@parameter.outer", desc = "Net argument/parameter start" },
                      ["]b"] = { query = "@block.outer", desc = "Next block start" },
                      ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                      ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
                    },
                    goto_next_end = {
                      ["]M"] = { query = "@function.outer", desc = "Next method end" },
                      ["]C"] = { query = "@class.outer", desc = "Next class end" },
                      ["]A"] = { query = "@parameter.inner", desc = "Next argument/parameter end" },
                      ["]B"] = { query = "@block.outer", desc = "Next block end" },
                      ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                      ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                    },
                    goto_previous_start = {
                      ["[m"] = { query = "@function.outer", desc = "Previous method start" },
                      ["[c"] = { query = "@class.outer", desc = "Previous class start" },
                      ["[a"] = { query = "@parameter.outer", desc = "Previous argument/parameter start" },
                      ["[b"] = { query = "@block.outer", desc = "Previous block start" },
                      ["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
                      ["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
                    },
                    goto_previous_end = {
                      ["[M"] = { query = "@function.outer", desc = "Previous method end" },
                      ["[C"] = { query = "@class.outer", desc = "Previous class end" },
                      ["[A"] = { query = "@parameter.inner", desc = "Previous argument/parameter end" },
                      ["[B"] = { query = "@block.outer", desc = "Previous block end" },
                      ["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
                      ["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
                    },
                  },
                },
                playground = {
                  enable = true,
                  disable = {},
                  updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                  persist_queries = false, -- Whether the query persists across vim sessions
                  keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                  },
                },
              })
        end,
    },
    -- NOTE: js,ts,jsx,tsx Auto Close Tags
    {
        "windwp/nvim-ts-autotag",
        enabled = true,
        ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "xml" },
        config = function()
            -- Independent nvim-ts-autotag setup
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,           -- Auto-close tags
                    enable_rename = true,          -- Auto-rename pairs
                    enable_close_on_slash = false, -- Disable auto-close on trailing `</`
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true, -- Disable auto-closing for HTML
                    },
                    ["typescriptreact"] = {
                        enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
                    },
                },
            })
        end,
    },
}
