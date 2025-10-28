  return {
     'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_transparent_background = true
        vim.cmd.colorscheme('gruvbox-material')

        -- Toggle background transparency
        local bg_transparent = true
        
        local toggle_transparency = function()
            bg_transparent = not bg_transparent
            vim.g.gruvbox_material_transparent_background = bg_transparent
            vim.cmd.colorscheme('gruvbox-material')
        end

        vim.keymap.set('n', '<leader>bg', toggle_transparency, {noremap = true, silent = true})
      end
  }
