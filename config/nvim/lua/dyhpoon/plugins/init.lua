return {
  -- git
  {
    'lewis6991/gitsigns.nvim', -- show line modifications on left hand side
    lazy = true,
    event = "BufRead",
    opts = {
        current_line_blame = true
    }
  },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  { 'shumphrey/fugitive-gitlab.vim' },

  -- multi select
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },

  -- markdown
  {
    'iamcco/markdown-preview.nvim',
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  -- tmux
  { 'christoomey/vim-tmux-navigator' }, -- tmux & split window navigation

  -- Ruby
  { 'vim-ruby/vim-ruby' },
  { 'tpope/vim-rails' },

  -- Copilot
  {
    'github/copilot.vim',
    event = "BufRead",
  },

  -- Other Utils
  {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require('Comment').setup()
    end
  }
}