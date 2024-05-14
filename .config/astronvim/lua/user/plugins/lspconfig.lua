return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "gopls",
        "pyright",
        "rust_analyzer",
        -- "solargraph"
      },
    },
  },
}
