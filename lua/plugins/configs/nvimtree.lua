require("nvim-tree").setup({
  open_on_setup_file = true,
	sort_by = "case_sensitive",
  view = {
		side = 'left',
		width = '30%',
		
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
	
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
