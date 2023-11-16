return {
	'stevearc/overseer.nvim',
	lazy = false,
	config = function()
		require('overseer').setup()
	end
}
