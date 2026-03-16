return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    'fang2hou/blink-copilot',
    opts = {
      max_completions = 3,
    },
  },
}
