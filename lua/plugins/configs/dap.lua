local dap = require('dap')
local opts = { silent = true }

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
  {
    type = 'c',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '/usr/bin/lldb'
    end,
  },
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
      local name = vim.fn.input('Executable name (filter): ')
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  },
}


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
