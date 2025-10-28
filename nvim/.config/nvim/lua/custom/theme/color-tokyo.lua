return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},

  config = function()
    local bg_transparent = true
    require('tokyonight').setup {
      transparent = bg_transparent,
    }

    vim.cmd.colorscheme 'tokyonight-night'

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      require('tokyonight').setup {
        styles = { transparency = bg_transparent },
      }
      vim.cmd.colorscheme 'tokyonight-night'
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
