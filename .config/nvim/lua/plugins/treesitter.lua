-- https://github.com/dimtion/dotfiles/blob/master/.config/nvim/lua/dimtion/plugins/treesitter.lua
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/nvim-lua/kickstart.nvim/issues/1874
return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    build = ':TSUpdate',
    lazy = false,
    config = function()
      local filetypes = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
      require('nvim-treesitter').install(filetypes)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '*' },
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start()
            -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            -- vim.wo.foldmethod = 'expr'
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  -- The autor use keys to implement lazy load
  {
    -- Use keys to avoid startup load
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    init = function ()
      vim.g.no_plugin_maps = true
    end,
    keys = {
      -- select
      {
        "af", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end,
        desc = "Function outer",
      },
      {
        "if", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end,
        desc = "Function inner",
      },
      {
        "aC", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
        end,
        desc = "Class outer",
      },
      {
        "iC", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
        end,
        desc = "Class inner",
      },
      {
        "ac", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
        end,
        desc = "Comment outer",
      },
      {
        "ic", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@comment.inner", "textobjects")
        end,
        desc = "Comment inner",
      },
      {
        "as", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
        end,
        desc = "Local scope",
      },
      -- moves
      {
        "]f", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        desc = "Next function start",
      },
      {
        "]F", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end,
        desc = "Next function end",
      },
      {
        "[f", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        desc = "Previous function start",
      },
      {
        "[F", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end,
        desc = "Previous function end",
      },
    },
    opts = {
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        selection_modes = {
          ["@function.outer"] = "V", -- linewise
          ["@function.inner"] = "V",
          ["@class.outer"] = "V",
          ["@class.inner"] = "V",
          ["@comment.inner"] = "V",
          ["@comment.outer"] = "V",
        },
      },
      move = {
        -- whether to set jumps in the jumplist
        set_jumps = true,
      },
    },
    config = function(opts)
      require("nvim-treesitter-textobjects").setup(opts)

      -- Setting them up outside of Lazy configuration, since it does not work
      -- properly: f, F keys are not configured properly

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      local ts_repeat_move =
        require "nvim-treesitter-textobjects.repeatable_move"
      vim.keymap.set(
        { "n", "x", "o" },
        ";",
        ts_repeat_move.repeat_last_move
      )
      vim.keymap.set(
        { "n", "x", "o" },
        ",",
        ts_repeat_move.repeat_last_move_opposite
      )

      -- Make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set(
        { "n", "x", "o" },
        "f",
        ts_repeat_move.builtin_f_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "F",
        ts_repeat_move.builtin_F_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "t",
        ts_repeat_move.builtin_t_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "T",
        ts_repeat_move.builtin_T_expr,
        { expr = true }
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    vim.keymap.set("n", "[c", function()
        require("treesitter-context").go_to_context()
    end, { desc = "Go to context" })
  },
}
