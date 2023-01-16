--- Setup Lazy Neovim
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

--- Map Leader Key to <space>
vim.g.mapleader = ' '
vim.opt.termguicolors = true

require("lazy").setup("plugins")
require("impatient")
require("functions")
require("mappings")
require("settings")
