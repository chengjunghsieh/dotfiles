return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", },
  opts = {
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    ensure_installed = {
      "c",
      "cpp",
      "dockerfile",
      "elixir",
      "eex",
      "heex",
      "gitignore",
      "go",
      "gomod",
      "gowork",
      "javascript",
      "json",
      "lua",
      "markdown",
      "proto",
      "python",
      "rego",
      "ruby",
      "rust",
      "sql",
      "typescript",
      "vim",
      "yaml",
    },
    indent = {
      enable = true,
      disable = {
        "python",
      },
    },
    highlight = {
      enable = true,
      disable = { "markdown" },
      --   -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      --   -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      --   -- Using this option may slow down your editor, and you may see some duplicate highlights.
      --   -- Instead of true it can also be a list of languages
      --   additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        scope_incremental = '<Tab>',
        node_decremental = '<S-Tab>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- you can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      -- swap = {
      --   enable = true,
      --   swap_next = {
      --     ['<leader>a'] = '@parameter.inner',
      --   },
      --   swap_previous = {
      --     ['<leader>A'] = '@parameter.inner',
      --   },
      -- },
    },
  }
}
