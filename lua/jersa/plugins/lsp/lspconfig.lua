local now_if_args = _G.Config.now_if_args

now_if_args(function()
  add({ source = "neovim/nvim-lspconfig", depends = { "hrsh7th/cmp-nvim-lsp", "antosha417/nvim-lsp-file-operations", "ray-x/lsp_signature.nvim" } })

  vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
          -- Buffer local mappings
          local opts = { buffer = ev.buf, silent = true }
          local map = vim.keymap.set

          -- Keymaps
          opts.desc = "Show LSP references"
          map("n", "gr", function() Snacks.picker.lsp_references() end, opts)

          opts.desc = "Go to declaration"
          map("n", "gD", function() Snacks.picker.lsp_declarations() end, opts)

          opts.desc = "Show LSP definitions"
          map("n", "gd", function () Snacks.picker.lsp_definitions() end, opts)

          opts.desc = "Show LSP implementations"
          map("n", "gI", function() Snacks.picker.lsp_implementations() end, opts)

          opts.desc = "Show LSP type definitions"
          map("n", "gt", function() Snacks.picker.lsp_type_definitions() end, opts)

          opts.desc = "See available code actions"
          vim.keymap.set({ "n", "v" }, "<leader>ca", function()
              vim.lsp.buf.code_action()
          end, opts)

          opts.desc = "Smart rename"
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          opts.desc = "Show buffer diagnostics"
          vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

          opts.desc = "Show line diagnostics"
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

          opts.desc = "Show documentation for what is under cursor"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Restart LSP"
          vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

          vim.keymap.set("i", "<C-h>", function()
              vim.lsp.buf.signature_help()
          end, opts)

          opts.desc = "Calls Incoming"
          map("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, opts)

          opts.desc = "Calls Outgoing"
          map("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, opts)

          opts.desc = "LSP Symbols"
          map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, opts)

          opts.desc = "LSP Workspace Symbols"
          map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, opts)
      end,
  })

  -- Define sign icons for each severity
  local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
  }

  -- Set diagnostic config
  vim.diagnostic.config({
      signs = {
          text = signs,
      },
      virtual_text = true,
      underline = true,
      update_in_insert = false,
  })

  -- Setup servers
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- Global LSP settings (applied to all servers)
  vim.lsp.config('*', {
      capabilities = capabilities,
  })

  -- Configure and enable LSP servers
  -- lua_ls
  vim.lsp.config("lua_ls", {
      settings = {
          Lua = {
              runtime = {
                version = "LuaJIT"
              },
              diagnostics = {
                  globals = { "vim", "Snacks" },
              },
              completion = {
                  callSnippet = "Replace",
              },
              workspace = {
                  library = {
                      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                      [vim.fn.stdpath("config") .. "/lua"] = true,
                  },
              },
          },
      },
  })
  vim.lsp.enable("lua_ls")

  -- jdts
  vim.lsp.enable("jdts", false)

  -- docker_compose_language_service
  vim.lsp.enable("docker_compose_language_service")

  -- dockerls
  vim.lsp.enable("dockerls")

  -- eslint
  vim.lsp.enable("eslint")

  -- phpactor
  vim.lsp.enable("phpactor")

  -- tailwindcss
  vim.lsp.enable("tailwindcss")

  -- vtsls
  vim.lsp.enable("vtsls")
end)
