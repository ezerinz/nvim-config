local g = vim.g
local key = vim.keymap

-- leader, default space
g.mapleader = ' '

-- write / save
key.set('n', '<leader>w', '<cmd>write<cr>')

-- quit / close
key.set('n', '<leader>q', '<cmd>quit<cr>')
key.set({'n', 'x'}, '<leader>c', '"+y')
key.set({'n', 'x'}, '<leader>v', '"+p')

-- buffer control
key.set('n', '<leader>bd', '<cmd>BufDel<cr>') -- delete current buffer
key.set('n', '<leader>b.', '<cmd>BufferLineCycleNext<cr>') -- next cycle buffer
key.set('n', '<leader>b,', '<cmd>BufferLineCyclePrev<cr>') -- prev cycle buffer

-- nvimtree keybind
key.set('n', '<leader>nt', '<cmd>NvimTreeToggle<cr>')
key.set('n', '<leader>nm', '<cmd>NvimTreeFocus<cr>')
