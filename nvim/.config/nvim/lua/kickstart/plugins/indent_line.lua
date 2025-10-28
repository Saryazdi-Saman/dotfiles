return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      -- Change the indentation carachter
      indent = {
        char = '╎',
        tab_char = '╎',
      },
      scope = {
        show_start = false,
        show_end = false,
        show_exact_scope = true,
      },
    },
  },
}
