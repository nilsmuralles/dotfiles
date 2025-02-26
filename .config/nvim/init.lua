local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
local function load_plugins_from_dir(directory)
    local result = {}

    -- Helper function to scan directories recursively
    local function scan_dir(dir)
        local handle = vim.loop.fs_scandir(dir)
        if not handle then return end

        while true do
            local entry = vim.loop.fs_scandir_next(handle)
            if not entry then break end

            local full_path = dir .. "/" .. entry
            local stat = vim.loop.fs_stat(full_path)

            if stat and stat.type == "directory" then
                scan_dir(full_path) -- Recursively scan subdirectories
            elseif entry:match("%.lua$") then
                -- Load the Lua file as a module
                local success, plugin = pcall(dofile, full_path)
                if success and type(plugin) == "table" then
                    table.insert(result, plugin)
                else
                    print("Error loading:", full_path, plugin)
                end
            end
        end
    end

    scan_dir(directory)
    return result
end

-- Use Neovim's standard path for plugin configurations
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

-- Load all plugins from the directory
local plugins = load_plugins_from_dir(plugin_dir)

-- Pass this directly to Lazy.nvim
require("lazy").setup(plugins)

