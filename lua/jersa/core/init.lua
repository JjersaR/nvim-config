local plugin_dir = vim.fn.stdpath("config") .. "/lua/jersa/core"

for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
  -- Solo cargar archivos .lua que no sean init.lua
  if file:match("%.lua$") and file ~= "init.lua" then
    local module = "jersa.core." .. file:gsub("%.lua$", "")
    local ok, err = pcall(require, module)
    if not ok then
      vim.notify("Loading error " .. module .. ": " .. err, vim.log.levels.ERROR)
    end
  end
end
