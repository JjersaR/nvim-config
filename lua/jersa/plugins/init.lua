-- Requiere todos los archivos Lua (excepto init.lua) dentro de plugins/
local plugin_path = vim.fn.stdpath("config") .. "/lua/jersa/plugins"
for _, path in ipairs(vim.fs.find(function(name)
  return name:match("%.lua$") and not name:match("init%.lua$")
end, { limit = math.huge, type = "file", path = plugin_path })) do
  local rel = path:match("lua/(.*)%.lua$")
  local module = rel:gsub("/", ".")
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify("Loading error " .. module .. ": " .. err, vim.log.levels.ERROR)
  end
end
