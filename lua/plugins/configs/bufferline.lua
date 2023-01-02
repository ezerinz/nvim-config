require('bufferline').setup 
		{
        options = {
            mode = "bufferline",
            max_name_length = 18,
            max_prefix_length = 15,
						truncate_names = true,
						tab_size = 18,
            diagnostics = "nvim_lsp",
						--[[diagnostics_indicator = function(count, level, diagnostics_dict, context)
							local icon = level:match("error") and " " or " "
							return " " .. icon .. count
						end,]]
            diagnostics_update_in_insert = true,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
										highlight = "Directory",
										separator = true,
                }
            },
						color_icons = true,
            show_buffer_icons = true, 
            show_buffer_close_icons = false,
            show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
            show_close_icon = false,
            show_tab_indicators = false,
            show_duplicate_prefix = false, 
            persist_buffer_sort = false,
            separator_style = "thin",--"slant", -- "thin", -- | "thick" | "thin" | { 'any', 'any' },
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            hover = {
                enabled = false,
                delay = 200,
                reveal = {'close'}
            },
            sort_by = 'insert_at_end'
        },
				highlights = {
				offset_separator = {
					bg = '#1a212e',
				},
		},
  }

		
--require'bufferline'.setup{
--	highlights = {
--		offset_separator = {
--			fg = '#4f4b47', 
--			bg = '#322f2e',
--		},
--	}
--}
