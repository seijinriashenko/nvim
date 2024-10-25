return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch Debugger",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            -- Keymaps
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Start debugging" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: step out" })
            vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Break condition: "))
            end, { desc = "DAP: Set conditional breakpoint" })
            vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open [r]epl window" })
            -- vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run [l]ast debug session" })
            vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP: [T]erminate session" })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            ensure_installed = { "codelldb" },
            handlers = {},
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        event = "VeryLazy",
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()
            -- dap.listeners.after.event_initialized["dapui_config"] = function()
            --  dapui.open({})
            -- end
            -- dap.listeners.before.event_terminated["dapui_config"] = function()
            --  dapui.close({})
            -- end
            -- dap.listeners.before.event_exited["dapui_config"] = function()
            --  dapui.close({})
            -- end
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
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
    },
}
