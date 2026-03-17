return {
  'folke/persistence.nvim',
  lazy = false,
  opts = {
    need = 0,
  },
  config = function(_, opts)
    local persistence = require 'persistence'
    persistence.setup(opts)
    -- TODO: exclude neo-tree from saving and loading
    --  need to add pre-save or use vim.api.autocmd to close neo-tree after PersistencePreSave
    --
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      once = true,
      callback = function()
        persistence.load()
        vim.schedule(function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
              local name = vim.api.nvim_buf_get_name(buf)
              if name ~= '' and vim.fn.filereadable(name) == 1 then vim.api.nvim_buf_call(buf, function() vim.cmd 'silent! edit' end) end
            end
          end
        end)
      end,
    })
  end,
}
