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
					["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false,} },
				},
				width = 28,
				
				
 
			},
			hide_root_node = true, -- Hide the root node.
            retain_hidden_root_indent = false, -- IF the root node is hidden, keep the indentation anyhow. 
			add_blank_line_at_top = false,
			indent_size = 3,

			

			 
			
		})
        
	end,
}