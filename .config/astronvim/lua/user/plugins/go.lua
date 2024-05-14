return {
	"ray-x/go.nvim",
  dependencies = {  -- optional packages
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  opts = {
  	go='go', -- go command, can be go[default] or go1.18beta1
	  goimport='gopls', -- goimport command, can be gopls[default] or goimport
	  fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
	  gofmt = 'gofumpt', --gofmt cmd,
	  max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
	  tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
		lsp_cfg = false , -- true: use non-default gopls setup specified in go/lsp.lua
                   -- false: do nothing
                   -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
                   --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    -- lsp_diag_underline = false,
    lsp_on_attach = nil,
    luasnip = true
  }
}