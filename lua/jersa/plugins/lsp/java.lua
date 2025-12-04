return {
  "nvim-java/nvim-java",
  config = function()
    require("java").setup()
    vim.lsp.enable("jdtls")
    vim.lsp.config("jdtls", {
      default_config = {
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-21",
                  path = "/usr/lib/jvm/java-21-openjdk/",
                  default = true,
                },
              },
            },
          },
        },
      },
    })
  end,
}
