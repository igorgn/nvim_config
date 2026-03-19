return {
  dir = '/Users/igorgn/Documents/projects/rust/promptline',
  config = function()
    require('promptline').setup {
      backend = 'copilot_chat', -- uses your existing `claude` login
      model = 'auto',
      presets = {
        { label = 'Fix', prompt = 'Fix the issues', mode = 'edit' },
        { label = 'Idiomatic', prompt = 'Make more idiomatic Rust', mode = 'edit' },
        { label = 'Docs', prompt = 'Add doc comments', mode = 'edit' },
        { label = 'Explain', prompt = 'Explain this', mode = 'explain' },
      },
    }
  end,
}
