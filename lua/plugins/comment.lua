return {
	'NumToStr/Comment.nvim',
	event = 'VeryLazy',
	config = function()
		require('Comment').setup()
	end
}
