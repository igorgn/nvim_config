return {
  'igorgn/promptline.nvim',
  -- dir = '/Users/igorgn/Documents/projects/rust/promptline',
  config = function()
    require('promptline').setup {
      backend = 'copilot_chat',
      model = 'auto',
      presets = {
        { label = 'Idiomatic', prompt = 'Make more idiomatic Rust', mode = 'edit' },
        { label = 'Fix', prompt = 'Fix the issues', mode = 'edit' },
        { label = 'Explain', prompt = 'Explain this', mode = 'explain' },
      },
    }
  end,
}
