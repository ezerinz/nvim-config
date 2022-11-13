require("nvterm").setup({
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.1,
        col = 1.0,
        width = 0.4,
        height = 0.7,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
})

local terminal = require("nvterm.terminal")

function ft_detect(ft)
	path = vim.fn.expand('%')
	cmd = 'echo "Filetype not recognized "'
	if ft == 'python' then
		cmd = 'python3 -u '
	elseif ft == 'javascript' then
		cmd = 'node '
	elseif ft == 'html' then
		cmd = 'firefox '
	elseif ft == 'java' then
		cmd = 'java '
	elseif ft == 'lua' then
		cmd = 'lua '
	end

	return cmd .. path
end


local toggle_modes = {'n', 't'}
local mappings = {
  { 'n', '<leader>tr', function () require("nvterm.terminal").send(ft_detect(vim.bo.filetype)) end },
  { toggle_modes, '<leader>th', function () require("nvterm.terminal").toggle('horizontal') end },
  { toggle_modes, '<leader>tv', function () require("nvterm.terminal").toggle('vertical') end },
  { toggle_modes, '<leader>tf', function () require("nvterm.terminal").toggle('float') end },
	{ toggle_modes, '<leader>tc', function () require("nvterm.terminal").send('clear') end },
}

local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
