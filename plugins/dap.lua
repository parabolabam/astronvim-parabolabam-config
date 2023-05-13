return {
  "mfussenegger/nvim-dap",
  enabled = vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        handlers = {
          ["typescript"] = {
            type = "node",
            request = "launch",
            program = "${file}",
            cwd = "${workspaceFolder}",
            args = {
              "-r",
              "tsconfig-paths/register",
            },
            console = "integratedTerminal",
            adapter = "node",
          },
          ["javascript"] = {
            type = "node",
            request = "launch",
            program = "${file}",
            cwd = "${workspaceFolder}",
            args = {
              "-r",
              "tsconfig-paths/register",
            },
            console = "integratedTerminal",
            adapter = "node",
          },

        }
      },
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
  },
  event = "User AstroFile",
}
