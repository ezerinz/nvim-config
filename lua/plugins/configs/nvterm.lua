require("nvterm").setup({
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.05,
        col = 1.0,
        width = 0.2,
        height = 0.8,
        border = "single",
      },
      horizontal = 
			{ 
				location = "rightbelow", 
				split_ratio = .3,
			},
      vertical = { location = "rightbelow", split_ratio = .3 },
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
--require("nvterm.terminal").send("cd " .. vim.fn.expand('%:h'))
function ft_detect(ft)
	path = vim.fn.expand('%:h')
	file = vim.fn.expand('%:t')
	cwd = vim.fn.getcwd()
	cmd = 'echo "Filetype not recognized "'
	cd = 'cd ' .. path .. ' && '
	if ft == 'python' then
		cmd = cd .. 'python3 -u ' .. file
	elseif ft == 'javascript' then
		cmd = cd .. 'node ' .. file
	elseif ft == 'html' then
		cmd = cd .. 'firefox ' .. file
	elseif ft == 'java' then
		cmd = 'cd ' .. require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}) .. ' && gradle -q --console plain run'
	elseif ft == 'lua' then
		cmd = cd .. 'lua ' .. file
	end

	return cmd
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
