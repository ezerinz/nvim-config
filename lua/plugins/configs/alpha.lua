local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {
"██████   █████                                ███                 ",
"░██████ ░░███                                ░░░                  ",
"░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  ",
"░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ",
"░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ",
"░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ",
"█████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████",
"░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░",
}



dashboard.section.buttons.val = {
 		dashboard.button( "SPC n t", "  File Explorer", ":ene <BAR> NvimTreeToggle<CR>"),
		dashboard.button( "SPC p u", "ﮮ  Plugin Update", ":PackerUpdate<CR>"),
    dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
}
local handle = io.popen('fortune')
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune
dashboard.config.opts.noautocmd = true
vim.cmd[[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.config)
