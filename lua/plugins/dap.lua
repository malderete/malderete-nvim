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
vim.keymap.set("n", "<leader>bt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>bc", dap.continue, {})

-- DAP Go
local dap_go_ok, dap_go = pcall(require, "dap-go")
if not dap_go_ok then
	return
end
dap_go.setup()


-- Define DAP signs
vim.fn.sign_define("DapBreakpoint", config.dap.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", config.dap.breakpoint)
vim.fn.sign_define("DapStopped", config.dap.stopped)

-- auto open dap-ui
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- init dap-ui
dapui.setup({})
    -- config.dapui)
