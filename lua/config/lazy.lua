local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {"williamboman/mason.nvim"},
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {'neovim/nvim-lspconfig'},
  {'onsails/lspkind-nvim'},
  {'williamboman/nvim-lsp-installer'},
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
		'hrsh7th/nvim-cmp',
		dependencies = {
			'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
		}
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {'norcalli/nvim-colorizer.lua'},
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {"neovim/nvim-lspconfig"},
  {
	"nvim-neo-tree/neo-tree.nvim",
	 branch = "v3.x",
	 dependencies = {
	  "nvim-lua/plenary.nvim",
	  "nvim-tree/nvim-web-devicons",
	  "MunifTanjim/nui.nvim",
	 }
  },
  {'nvim-lualine/lualine.nvim'},
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,

    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })

      local parsers = {
        "bash", "c", "c_sharp", "cpp", "dockerfile", "go", "html", "javascript",
        "json", "lua", "markdown", "markdown_inline", "python", "query", "regex",
        "ruby", "sql", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
      }

      for _, parser in ipairs(parsers) do
        vim.api.nvim_create_autocmd("FileType", {
          pattern = parser,
          callback = function()
            if not require("nvim-treesitter.parsers").has_parser(parser) then
              require("nvim-treesitter.install").ensure_installed(parser)
            end
          end,
        })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
    event = {
      "BufReadPost",
      "BufNewFile",
      "BufWritePre"
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
})