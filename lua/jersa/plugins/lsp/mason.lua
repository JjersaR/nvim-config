return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason_tool_installer = require("mason-tool-installer")

      require("mason").setup({
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "stylua",   -- lua formatter
          "sonarlint-language-server",
          "hadolint",
          "google-java-format",
        }
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "eslint",
          "lua_ls",
          "bashls",
          "dockerls",
          "docker_compose_language_service",
          "jdtls",
          "jsonls",
          "tailwindcss",
          "vtsls"
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "williamboman/mason-nvim-dap.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "javatest",
          "javadbg",
        },
      })
    end,
  },
}
