return {
  { "max397574/better-escape.nvim", enabled = false },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 1000 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
      }
      return opts
    end,
  },


  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       k = { name = "coding" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}

