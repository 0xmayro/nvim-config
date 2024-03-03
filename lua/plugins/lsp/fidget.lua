return {
	'j-hui/fidget.nvim',
	event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
	config = function()
		require('fidget').setup()
	end
}
