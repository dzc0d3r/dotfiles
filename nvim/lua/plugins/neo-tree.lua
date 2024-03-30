return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
        require("neo-tree").setup({
			window = {
				mappings = {
					["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
				},
				width = 28,
				hide_root_folder = true,
			},
			
		})
        
	end,
}