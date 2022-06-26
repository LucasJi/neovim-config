local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- plugin manager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- popup
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  -- lua
  use "nvim-lua/plenary.nvim" -- provide some useful functions

  -- paris
  use "windwp/nvim-autopairs" -- auto pairs

  -- comment
  use "numToStr/Comment.nvim" -- easily comment stuff

  -- theme
  use "kyazdani42/nvim-web-devicons" -- icons
  use "lunarvim/darkplus.nvim" -- a theme
  use "EdenEast/nightfox.nvim" -- a theme

  -- file-tree-explorer
  use "kyazdani42/nvim-tree.lua"

  -- buffer
  use { "akinsho/bufferline.nvim", tag="v2.*", requires = 'kyazdani42/nvim-web-devicons' } -- manage buffer lines
  use "moll/vim-bbye" -- delete buffers without closing windows or messing up layout

  -- status-line
  use 'nvim-lualine/lualine.nvim'

  -- terminal
  use { "akinsho/toggleterm.nvim", tag="v1.*" } -- persist and toggle multiple terminals during an editing session

  -- project-management
  use "ahmedkhalf/project.nvim"

  -- optimization
  use "lewis6991/impatient.nvim" -- speed up loading lua modules in Neovim to improve startup time
  use "psliwka/vim-smoothie" -- makes scrolling nice and smooth

  -- textobject-surroundings
  use "tpope/vim-surround"
  use "machakann/vim-sandwich"
  
  -- indent
  use "lukas-reineke/indent-blankline.nvim"

  -- dashboard
  use 'goolord/alpha-nvim'

  -- bug-fix
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- which-key
  use "folke/which-key.nvim"

    -- cmp-plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- code highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  -- use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
