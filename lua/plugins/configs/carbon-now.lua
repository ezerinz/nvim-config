local carbon = require('carbon-now')
carbon.setup({
  base_url = "https://carbon.now.sh/",
  open_cmd = "xdg-open",
  options = {
    theme = "one-dark",
    window_theme = "none",
    font_family = "JetBrains Mono",
    font_size = "18px",
    bg = "gray",
    line_numbers = true,
    line_height = "133%",
    drop_shadow = false,
    drop_shadow_offset_y = "20px",
    drop_shadow_blur = "68px",
    width = "680",
    watermark = false,
  },
})
vim.keymap.set("v", "<leader>ss", ":CarbonNow<CR>", { noremap = true, silent = true})
