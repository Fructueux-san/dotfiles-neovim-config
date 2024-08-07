local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sharkdp/fd'
  use "rebelot/kanagawa.nvim"
  use {
    'nvim-telescope/telescope.nvim',
    tag='0.1.5',
    requires="nvim-lua/plenary.nvim"
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    }
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use "glepnir/lspsaga.nvim"
  use "windwp/nvim-ts-autotag"

  use "hrsh7th/nvim-cmp"
  use {"hrsh7th/cmp-path", after = "nvim-cmp" }
  use "hrsh7th/cmp-nvim-lsp"

  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use 'hrsh7th/vim-vsnip'

  use {
      "williamboman/mason.nvim",
      config = function()
          require("mason").setup()
      end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    config= function()
        require ("mason-lspconfig").setup()
      end,
  }
  use 'neovim/nvim-lspconfig'

  use "norcalli/nvim-colorizer.lua"
  use {
    "xiyaowong/nvim-transparent",
    config = function()
            require("transparent").setup({
                -- enable = true,
                -- extra_groups = {
                --     "BufferLineTabClose",
                --     "BufferlineBufferSelected",
                --     "BufferLineFill",
                --     "BufferLineBackground",
                --     "BufferLineSeparator",
                --     "BufferLineIndicatorSelected",
                -- },
                -- exclude_groups = {},
            })
        end,
  }
  --
  -- use({
  --         "williamboman/mason.nvim",
  --         config = function()
  --             require("mason").setup()
  --         end,
  -- })

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
    --config = true
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use "terrortylor/nvim-comment"
  use "EmranMR/tree-sitter-blade"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
