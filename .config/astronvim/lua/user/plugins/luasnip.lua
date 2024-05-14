return {
  "L3MON4D3/LuaSnip",
  dependencies = "rafamadriz/friendly-snippets",
  config = function(plugin, opts)
    local snippet_path = os.getenv("XDG_CONFIG_HOME") .. "/astronvim/lua/user/snippets"
    require "plugins.configs.luasnip" (plugin, opts)                              -- include the default astronvim config that calls the setup call
    require("luasnip.loaders.from_vscode").lazy_load { paths = { snippet_path } } -- load snippets paths
  end,
  filetype_extend = {
    python = { "django" },
    ruby = { "rails" },
    javascript = { "javascriptreact" },
  },
}
