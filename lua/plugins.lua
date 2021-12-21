vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'tjdevries/colorbuddy.vim'}

  use {'nvim-treesitter/nvim-treesitter', opt = true}
  
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
end)
