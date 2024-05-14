return {
  colorscheme = "duskfox",
  polish = function()
    -- Define autocommands with Lua APIs
    -- See: h:api-autocmd, h:augroup
    local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
    local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

    -- Set foldmethod
    augroup("setFoldMethod", { clear = true })
    autocmd('Filetype', {
      group = 'setFoldMethod',
      pattern = { 'c', 'cpp', 'go', 'python', 'ruby' },
      command = 'set foldmethod=marker'
    })

    -- Set [go] indentation to 4 spaces
    augroup('setIndent', { clear = true })
    autocmd('Filetype', {
      group = 'setIndent',
      pattern = { 'go' },
      command = 'setlocal shiftwidth=4 tabstop=4 softtabstop=4'
    })

    -- Set go.nvim keymapping
    augroup('setGoKeybinding', { clear = true })
    autocmd('Filetype', {
      group = 'setGoKeybinding',
      pattern = { 'go' },
      callback = function()
        local wk = require("which-key")
        local default_options = { silent = true }
        wk.register({
          k = {
            name = "Coding",
            a = { "<cmd>GoCodeAction<cr>", "Code action" },
            e = { "<cmd>GoIfErr<cr>", "Add if err" },
            h = {
              name = "Helper",
              a = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
              r = { "<cmd>GoRMTag<cr>", "Remove tags to struct" },
              c = { "<cmd>GoCoverage<cr>", "Test coverage" },
              g = { "<cmd>lua require('go.comment').gen()<cr>", "Generate comment" },
              v = { "<cmd>GoVet<cr>", "Go vet" },
              t = { "<cmd>GoModTidy<cr>", "Go mod tidy" },
              i = { "<cmd>GoModInit<cr>", "Go mod init" },
            },
            i = { "<cmd>GoToggleInlay<cr>", "Toggle inlay" },
            l = { "<cmd>GoLint<cr>", "Run linter" },
            o = { "<cmd>GoPkgOutline<cr>", "Outline" },
            r = { "<cmd>GoRun<cr>", "Run" },
            s = { "<cmd>GoFillStruct<cr>", "Autofill struct" },
            t = {
              name = "Tests",
              r = { "<cmd>GoTest<cr>", "Run tests" },
              a = { "<cmd>GoAlt!<cr>", "Open alt file" },
              s = { "<cmd>GoAltS!<cr>", "Open alt file in split" },
              v = { "<cmd>GoAltV!<cr>", "Open alt file in vertical split" },
              u = { "<cmd>GoTestFunc<cr>", "Run test for current func" },
              f = { "<cmd>GoTestFile<cr>", "Run test for current file" },
            },
            x = {
              name = "Code Lens",
              l = { "<cmd>GoCodeLenAct<cr>", "Toggle Lens" },
              a = { "<cmd>GoCodeAction<cr>", "Code Action" },
            },
          },
        }, { prefix = "<leader>", mode = "n", default_options })
        wk.register({
          k = {
            -- name = "Coding",
            j = { "<cmd>'<,'>GoJson2Struct<cr>", "Json to struct" },
          },
        }, { prefix = "<leader>", mode = "v", default_options })
      end
    })

    -- Run gofmt + goimport on save
    local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
  end
}
