local dap = require('dap')
local opts = { silent = true }

vim.keymap.set("n", "<leader>bp", function()
  dap.toggle_breakpoint()
end, opts)

vim.keymap.set("n", "<leader>dc", function()
  dap.continue()
end, opts)

vim.keymap.set("n", "<leader>ds", function()
  dap.stepover()
end, opts)

vim.keymap.set("n", "<leader>di", function()
  dap.step_into()
end, opts)

vim.keymap.set("n", "<leader>dt", function()
  dap.terminate()
end, opts)
