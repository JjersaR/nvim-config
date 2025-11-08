local capabilities = require("lsp.handlers").capabilities

-- local _lspconfig, lspconfig = pcall(require, "lspconfig")
local lspconfig = vim.lsp.config
if lspconfig then
  -- Python
  lspconfig("pyright", {
    autostart = false,
    capabilities = capabilities,
    filetypes = { "python" },
  })

  -- LUA
  lspconfig("lua_ls", {
    autostart = false,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })
  -- Rust
  lspconfig("rust_analyzer", {
    on_attach = function(client, bufnr)
      require("lsp.handlers").on_attach(client, bufnr)
      -- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
    -- capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = true,
        },
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  })

  -- Clangd (C++)
  lspconfig("clangd", {
    autostart = false,
    capabilities = capabilities,
  })

  -- Bash
  lspconfig("bashls", {
    autostart = true,
    capabilities = capabilities,
  })

  -- Javascript/Typescript
  lspconfig("eslint", {
    autostart = true,
    capabilities = capabilities,
    settings = {
      packageManager = "npm",
    },
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  })

  -- HTML
  lspconfig("html", {
    autostart = true,
    capabilities = capabilities,
  })

  -- CSS
  lspconfig("cssls", {
    autostart = true,
    capabilities = capabilities,
  })

  -- Dockerfile
  lspconfig("dockerls", {
    autostart = true,
    capabilities = capabilities,
  })

  -- Docker compose
  lspconfig("docker_compose_language_service", {
    autostart = true,
    capabilities = capabilities,
  })
  -- XML
  lspconfig("lemminx", {
    autostart = true,
    capabilities = capabilities,
  })

  -- Json Language Server
  lspconfig("jsonls", {
    autostart = true,
    capabilities = capabilities,
  })

  -- SQL Language Server
  lspconfig("sqlls", {
    autostart = false,
    capabilities = capabilities,
  })

end
