return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
	    require("lualine").setup {
		    options = {
			    theme = 'ayu_mirage'
		    }
	    }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
