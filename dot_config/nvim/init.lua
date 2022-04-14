require 'plugins'
require 'key'
require 'set'
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd[[autocmd BufWritePost key.lua PackerCompile]]
vim.cmd[[autocmd BufWritePost set.lua PackerCompile]]
