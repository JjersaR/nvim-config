add( "MagicDuck/grug-far.nvim" )

later(function()
  function far()
    local grug = require("grug-far")
    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    grug.open({
      transient = true,
      prefills = {
        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
      },
    })
  end

  vim.keymap.set("n", "<Leader>sr", far, { desc = "[S]earch and [R]eplace", silent = true })
end)
