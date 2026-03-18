return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
    },
    keys = {
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debugger Toggle Breakpoint" },
        { "<leader>dc", function() require("dap").continue() end, desc = "Debugger Continue" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Debugger Step Into" },
        { "<leader>do", function() require("dap").step_over() end, desc = "Debugger Step Over" },
        { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Debugger Run to Cursor" },
        { "<leader>dq", function() require("dap").terminate() end, desc = "Debugger Quit" },
        {
            "<leader>dw",
            function()
                require("dapui").float_element("watches", {
                    enter = true,
                    position = "center",
                    width = 60,
                     height = 20,
                    border = "rounded",
                })
            end,
            desc = "Debugger Watches",
        },
        {
            "<leader>dB",
            function()
                require("dapui").float_element("breakpoints", {
                    enter = true,
                    position = "center",
                    width = 60,
                    height = 20,
                    border = "rounded",
                })
            end,
            desc = "Debugger Breakpoints",
        },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Signs
        vim.fn.sign_define("DapBreakpoint", {
            text = "🔴",
            texthl = "DiagnosticSignError",
        })

        vim.fn.sign_define("DapBreakpointRejected", {
            text = "🔴",
            texthl = "DiagnosticSignError",
        })

        vim.fn.sign_define("DapStopped", {
            text = "",
            texthl = "DiagnosticSignWarn",
            linehl = "Visual",
            numhl = "DiagnosticSignWarn",
        })

        -- UI
        dapui.setup({
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.7 },
                        { id = "stacks", size = 0.3 },
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = { "repl" },
                    size = 10,
                    position = "bottom",
                },
            },
        })

        -- Go debugger
        require("dap-go").setup()

        -- Python debugger
        local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(debugpy_path)

        -- Virtual text
        require("nvim-dap-virtual-text").setup({
            virt_text_pos = "eol",
        })

        -- Auto open UI
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
    end,
}
