return {
  "akinsho/bufferline.nvim",
  version = "*",
  opts = {
    options = {
      mode = "buffers",

      numbers = "none",
      diagnostics = false,
      show_tab_indicators = false,
      indicator = { style = "none" },

      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,

      truncate_names = true,
      always_show_bufferline = false,

      persist_buffer_sort = true,
      sort_by = "insert_at_end",
      custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].filetype ~= "man" then
          return true
        end
      end,
    },
  },
}
