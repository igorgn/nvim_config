return {
  'igorgn/promptline.nvim',
  -- dir = '/Users/igorgn/Documents/projects/rust/promptline',
  config = function()
    require('promptline').setup {
      backend = 'copilot_chat',
      model = 'auto',
      presets = {
        { label = 'Fix', prompt = 'Fix the issues', mode = 'edit' },
        { label = 'Explain', prompt = 'Explain what does it do', mode = 'explain' },
        { label = 'Idiomatic', prompt = 'Make more idiomatic Rust', mode = 'edit' },
      },
    }
  end,
}
