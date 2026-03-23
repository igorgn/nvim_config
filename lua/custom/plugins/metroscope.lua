return {
  dir = '~/Documents/projects/igorgn/metroscope/neovim/metroscope.nvim',
  config = function()
    require('metroscope').setup {
      serena_dir = '~/Documents/projects/igorgn/serena',
    }
  end,
}
