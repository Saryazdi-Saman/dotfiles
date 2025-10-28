
return {
	'rose-pine/neovim',
	lazy = false,
	priority = 1000,
	name = 'rose-pine',
	config = function()
		local bg_transparent = true
		require("rose-pine").setup({
			variant = "main",
			styles = { transparency = bg_transparent }
		})

		vim.cmd.colorscheme('rose-pine')
		
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			require("rose-pine").setup({
				variant = "main",
				styles = { transparency = bg_transparent }
			})
			vim.cmd.colorscheme('rose-pine')
		end

		vim.keymap.set('n', '<leader>bg', toggle_transparency, {noremap = true, silent = true})
	end
}
