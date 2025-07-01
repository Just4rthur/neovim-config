return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Common on_attach function for keymaps
      local on_attach = function(_, bufnr)
        local bufmap = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
        bufmap("n", "K", vim.lsp.buf.hover, "Hover docs")
        bufmap("n", "gr", vim.lsp.buf.references, "References")
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        bufmap("n", "<leader>fo", function() vim.lsp.buf.format { async = true } end, "Format")
      end

      -- Capabilities for nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup language servers
      local servers = {
        ts_ls = {},
        pyright = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = { enable = false },
            },
          },
        },
        omnisharp = {
          cmd = { "omnisharp" }, -- assumes it's in PATH
          enable_import_completion = true,
        },
      }

      for server, opts in pairs(servers) do
        opts.on_attach = on_attach
        opts.capabilities = capabilities
        lspconfig[server].setup(opts)
      end
    end,
  },
}
