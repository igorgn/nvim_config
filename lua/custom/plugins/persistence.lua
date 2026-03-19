return {
  'folke/persistence.nvim',
  lazy = false,
  opts = {
    need = 0,
  },
  config = function(_, opts)
    local persistence = require 'persistence'
    persistence.setup(opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      once = true,
      callback = function()
        persistence.load()
        vim.schedule(function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
              local name = vim.api.nvim_buf_get_name(buf)
              if name ~= '' then vim.api.nvim_exec_autocmds('BufReadPost', { buffer = buf }) end
            end
          end
        end)
      end,
    })
  end,
}
