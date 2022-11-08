require('nvim-treesitter.configs').setup{
	ensure_installed = {"python", "javascript", "lua", "css", "html", "java"},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	}
}
