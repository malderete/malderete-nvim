local config = {
    dap = {
        breakpoint = {
            text = "",
            texthl = "DiagnosticSignError",
            linehl = "",
            numhl = "",
        },
        stopped = {
            text = "",
            texthl = "DiagnosticSignWarn",
            linehl = "Visual",
            numhl = "DiagnosticSignWarn",
        },
    },
}

-- DAP enhanced UI
local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
	return
end

-- DAP Core
local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end

-- DAP keybindings
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debugger toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debugger Continue" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debugger step Into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debugger step Over" })
vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Debugger run to Cursor" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Debugger Quit" })

-- DAP Go
local dap_go_ok, dap_go = pcall(require, "dap-go")
if not dap_go_ok then
	return
end
dap_go.setup()

-- DAP Python
local dap_py_ok, dap_py = pcall(require, "dap-python")
if not dap_py_ok then
	return
end
-- debugpy is managed by mason so get the path from there
local debugpy_mason_path = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'
dap_py.setup(debugpy_mason_path)

-- Define DAP signs
vim.fn.sign_define("DapBreakpoint", config.dap.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", config.dap.breakpoint)
vim.fn.sign_define("DapStopped", config.dap.stopped)

-- DAP UI auto open
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

-- DAP UI
dapui.setup({})
