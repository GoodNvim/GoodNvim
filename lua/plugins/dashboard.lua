local function header()
    return {
        '', '', '',
       "  _____                       _   _   _           _             ",
       " / ____|                     | | | \\ | |         (_)            ",
       "| |  __    ___     ___     __| | |  \\| | __   __  _   _ __ ___  ",
       "| | |_ |  / _ \\   / _ \\   / _` | | . ` | \\ \\ / / | | | '_ ` _ \\ ",
       "| |__| | | (_) | | (_) | | (_| | | |\\  |  \\ V /  | | | | | | | |",
       " \\_____|  \\___/   \\___/   \\__,_| |_| \\_|   \\_/   |_| |_| |_| |_|",
       " ",                         
        '', '', ''
    }
end

require('dashboard').setup {
    theme = 'doom',
	hide = {
		statusline = true,
	},
    config = {
        header = header(),
        center = {
            {
				icon = '  ',
                desc = 'New file',
				key = 'n',
                action = ':ene | startinsert'
            }, {
				icon = '  ',
                desc = 'Find files',
                key = 'f',
                action = ':Telescope find_files'
            }, {
				icon = '  ',
                desc = 'Open recently',
                key = 'r',
                action = ':Telescope oldfiles'
            }, {
				icon = '  ',
                desc = 'Terminal',
                key = 't',
                action = ':ToggleTerm direction=tab name=terminal'
            }, {
				icon = '󰒲  ',
                desc = 'Lazy',
                key = 'l',
	            action = ':Lazy'
            }, {
				icon = '  ',
                desc = 'Quit', 
                key = 'q',
                action = ':qa'
            }, 
        },
		footer = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return {"󰒲 GoodNvim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
		end,
	},
}

