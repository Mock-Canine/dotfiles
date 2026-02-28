return {
-- Look for lazydev if having time
{ -- Autocompletion
    'saghen/blink.cmp',
    -- Use my snippets instead, if added, it will be autoloaded
    -- dependencies = { 'rafamadriz/friendly-snippets' },
    event = 'VimEnter',
    version = '1.*',
    -- Remove luasnip as the snippet engine
    opts = {
      keymap = {
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      -- Snippets is more useful than lsp in c
      sources = {
        providers = {
          snippets = { score_offset = 5 },
          lsp      = { score_offset = 0 },
          path     = { score_offset = -5 },
          buffer   = { score_offset = -10 },
        },
      },
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'prefer_rust_with_warning' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },
}
