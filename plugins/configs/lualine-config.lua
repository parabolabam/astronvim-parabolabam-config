-- local M = {}
--
-- function M.config()
--    -- Eviline config for lualine
--     -- Author: shadmansaleh
--     -- Credit: glepnir
--     local lualine = require('lualine')
--
--     -- Color table for highlights
--     -- stylua: ignore
--     local colors = {
--       bg       = '#202328',
--       fg       = '#bbc2cf',
--       yellow   = '#ECBE7B',
--       cyan     = '#008080',
--       darkblue = '#081633',
--       green    = '#98be65',
--       orange   = '#FF8800',
--       violet   = '#a9a1e1',
--       magenta  = '#c678dd',
--       blue     = '#51afef',
--       red      = '#ec5f67',
--     }
--
--     local conditions = {
--       buffer_not_empty = function()
--         return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--       end,
--       hide_in_width = function()
--         return vim.fn.winwidth(0) > 80
--       end,
--       check_git_workspace = function()
--         local filepath = vim.fn.expand('%:p:h')
--         local gitdir = vim.fn.finddir('.git', filepath .. ';')
--         return gitdir and #gitdir > 0 and #gitdir < #filepath
--       end,
--     }
--
--     -- Config
--     local config = {
--       options = {
--         -- Disable sections and component separators
--         component_separators = '',
--         section_separators = '',
--         theme = {
--           -- We are going to use lualine_c an lualine_x as left and
--           -- right section. Both are highlighted by c theme .  So we
--           -- are just setting default looks o statusline
--           normal = { c = { fg = colors.fg, bg = colors.bg } },
--           inactive = { c = { fg = colors.fg, bg = colors.bg } },
--         },
--       },
--       sections = {
--         -- these are to remove the defaults
--         lualine_a = {},
--         lualine_b = {},
--         lualine_y = {},
--         lualine_z = {},
--         -- These will be filled later
--         lualine_c = {},
--         lualine_x = {},
--       },
--       inactive_sections = {
--         -- these are to remove the defaults
--         lualine_a = {},
--         lualine_b = {},
--         lualine_y = {},
--         lualine_z = {},
--         lualine_c = {},
--         lualine_x = {},
--       },
--     }
--
--     -- Inserts a component in lualine_c at left section
--     local function ins_left(component)
--       table.insert(config.sections.lualine_c, component)
--     end
--
--     -- Inserts a component in lualine_x at right section
--     local function ins_right(component)
--       table.insert(config.sections.lualine_x, component)
--     end
--
--     ins_left {
--       function()
--         return ' '
--       end,
--       color = { fg = colors.black }, -- Sets highlighting of component
--       padding = { left = 0, right = 1 }, -- We don't need space before this
--     }
--
--     ins_left {
--       -- mode component
--       function()
--         return ' ' .. vim.fn.mode()
--       end,
--       color = function()
--         -- auto change color according to neovims mode
--         local mode_color = {
--           n = colors.red,
--           i = colors.green,
--           v = colors.blue,
--           [''] = colors.blue,
--           V = colors.blue,
--           c = colors.magenta,
--           no = colors.red,
--           s = colors.orange,
--           S = colors.orange,
--           [''] = colors.orange,
--           ic = colors.yellow,
--           R = colors.violet,
--           Rv = colors.violet,
--           cv = colors.red,
--           ce = colors.red,
--           r = colors.cyan,
--           rm = colors.cyan,
--           ['r?'] = colors.cyan,
--           ['!'] = colors.red,
--           t = colors.red,
--         }
--         return { fg = mode_color[vim.fn.mode()] }
--       end,
--       padding = { right = 1 },
--     }
--
--     ins_left {
--       -- filesize component
--       'filesize',
--       cond = conditions.buffer_not_empty,
--     }
--
--     ins_left {
--       'filename',
--       cond = conditions.buffer_not_empty,
--       color = { fg = colors.magenta, gui = 'bold' },
--     }
--
--     ins_left { 'location' }
--
--     ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
--
--     ins_left {
--       'diagnostics',
--       sources = { 'nvim_diagnostic' },
--       symbols = { error = ' ', warn = ' ', info = ' ' },
--       diagnostics_color = {
--         color_error = { fg = colors.red },
--         color_warn = { fg = colors.yellow },
--         color_info = { fg = colors.cyan },
--       },
--     }
--
--     -- Insert mid section. You can make any number of sections in neovim :)
--     -- for lualine it's any number greater then 2
--     ins_left {
--       function()
--         return '%='
--       end,
--     }
--
--     ins_left {
--       -- Lsp server name .
--       function()
--         local msg = 'No Active Lsp'
--         local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--         local clients = vim.lsp.get_active_clients()
--         if next(clients) == nil then
--           return msg
--         end
--         for _, client in ipairs(clients) do
--           local filetypes = client.config.filetypes
--           if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--             return client.name
--           end
--         end
--         return msg
--       end,
--       icon = ' LSP:',
--       color = { fg = '#ffffff', gui = 'bold' },
--     }
--
--     -- Add components to right sections
--     ins_right {
--       'o:encoding', -- option component same as &encoding in viml
--       fmt = string.upper, -- I'm not sure why it's upper case either ;)
--       cond = conditions.hide_in_width,
--       color = { fg = colors.green, gui = 'bold' },
--     }
--
--     ins_right {
--       'fileformat',
--       fmt = string.upper,
--       icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--       color = { fg = colors.green, gui = 'bold' },
--     }
--
--     ins_right {
--       'branch',
--       icon = '',
--       color = { fg = colors.violet, gui = 'bold' },
--     }
--
--     ins_right {
--       'diff',
--       -- Is it me or the symbol for modified us really weird
--       symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
--       diff_color = {
--         added = { fg = colors.green },
--         modified = { fg = colors.orange },
--         removed = { fg = colors.red },
--       },
--       cond = conditions.hide_in_width,
--     }
--
--     ins_right {
--       function()
--         return ' '
--       end,
--       color = { fg = colors.black },
--       padding = { left = 1 },
--     }
--
--     -- Now don't forget to initialize lualine
--     lualine.setup(config)
--   end
--
-- return M

return {
	config = function()
		-- miasma colors	
		local colors = {
			bg = "#323d43",
			black = "#1c1c1c",
			grey = "#868d80",
			red = "#e68183",
			green = "#a7c080",
			yellow = "#B36D43",
			blue = "#78824B", 
			magenta = "#bb7744",
			cyan = "#C9A554",
			white = "#D7C483",
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width_first = function()
				return vim.fn.winwidth(0) > 80
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 70
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.yellow,
			Rv = colors.yellow,
			cv = colors.yellow,
			ce = colors.yellow,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		-- config
		local config = {
			options = {
				-- remove default sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					-- setting defaults to statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				-- clear defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- clear for later use
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- clear defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- clear for later use
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- insert active component in lualine_c at left section
		local function active_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- insert inactive component in lualine_c at left section
		local function inactive_left(component)
			table.insert(config.inactive_sections.lualine_c, component)
		end

		-- insert active component in lualine_x at right section
		local function active_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- insert inactive component in lualine_x at right section
		local function inactive_right(component)
			table.insert(config.inactive_sections.lualine_x, component)
		end

		-- dump object contents
		local function dump(o)
			if type(o) == 'table' then
				local s = ''
				for k, v in pairs(o) do
					if type(k) ~= 'number' then k = '"' .. k .. '"' end
					s = s .. dump(v) .. ','
				end
				return s
			else
				return tostring(o)
			end
		end

		-- active left section
		active_left({
			function()
				local icon
				local ok, devicons = pcall(require, 'nvim-web-devicons')
				if ok then
					icon = devicons.get_icon(vim.fn.expand('%:t'))
					if icon == nil then
						icon = devicons.get_icon_by_filetype(vim.bo.filetype)
					end
				else
					if vim.fn.exists('*WebDevIconsGetFileTypeSymbol') > 0 then
						icon = vim.fn.WebDevIconsGetFileTypeSymbol()
					end
				end
				if icon == nil then
					icon = ''
				end
				return icon:gsub("%s+", "") .. ' ' .. vim.fn.mode()
			end,
			color = function()
				return { bg = mode_color[vim.fn.mode()], fg = colors.black }
			end,
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
		})
		-- active_left({
		-- 	"filename",
		-- 	cond = conditions.buffer_not_empty,
		-- 	color = function()
		-- 		return { bg = mode_color[vim.fn.mode()], fg = colors.white }
		-- 	end,
		-- 	padding = { left = 1, right = 1 },
		-- 	separator = { right = "▓▒░" },
		-- 	symbols = {
		-- 		modified = "󰶻 ",
		-- 		readonly = " ",
		-- 		unnamed = " ",
		-- 		newfile = " ",
		-- 	},
		-- })
		active_left({
			"branch",
			icon = "",
			color = { bg = colors.blue, fg = colors.black },
			padding = { left = 0, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})

		-- inactive left section
		inactive_left({
			function()
				return ''
			end,
			cond = conditions.buffer_not_empty,
			color = { bg = colors.black, fg = colors.grey },
			padding = { left = 1, right = 1 },
		})
		inactive_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { bg = colors.black, fg = colors.grey },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
			symbols = {
				modified = "",
				readonly = "",
				unnamed = "",
				newfile = "",
			},
		})

		-- active right section
		active_right({
			function()
				local clients = vim.lsp.get_active_clients()
				local clients_list = {}
				for _, client in pairs(clients) do
					if (not clients_list[client.name]) then
						table.insert(clients_list, client.name)
					end
				end
				local lsp_lbl = dump(clients_list):gsub("(.*),", "%1")
				return lsp_lbl:gsub(",", ", ")
			end,
			icon = " ",
			color = { bg = colors.green, fg = colors.black },
			padding = { left = 1, right = 1 },
			cond = conditions.hide_in_width_first,
			separator = { right = "▓▒░", left = "░▒▓" },
		})

		active_right({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			colored = false,
			color = { bg = colors.magenta, fg = colors.black },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})
		active_right({
			"searchcount",
			color = { bg = colors.cyan, fg = colors.black },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})
		active_right({
			"location",
			color = { bg = colors.red, fg = colors.black },
			padding = { left = 1, right = 0 },
			separator = { left = "░▒▓" },
		})
		active_right({
			function()
				local cur = vim.fn.line(".")
				local total = vim.fn.line("$")
				return string.format("%2d%%%%", math.floor(cur / total * 100))
			end,
			color = { bg = colors.red, fg = colors.black },
			padding = { left = 1, right = 1 },
			cond = conditions.hide_in_width,
			separator = { right = "▓▒░" },
		})
		active_right({
			"o:encoding",
			fmt = string.upper,
			cond = conditions.hide_in_width,
			padding = { left = 1, right = 1 },
			color = { bg = colors.blue, fg = colors.black },
		})
		-- active_right({
		-- 	"fileformat",
		-- 	fmt = string.lower,
		-- 	icons_enabled = false,
		-- 	cond = conditions.hide_in_width,
		-- 	color = { bg = colors.blue, fg = colors.black },
		-- 	separator = { right = "▓▒░" },
		-- 	padding = { left = 0, right = 1 },
		-- })

		-- inactive right section
		inactive_right({
			"location",
			color = { bg = colors.black, fg = colors.grey },
			padding = { left = 1, right = 0 },
			separator = { left = "░▒▓" },
		})
		inactive_right({
			"progress",
			color = { bg = colors.black, fg = colors.grey },
			cond = conditions.hide_in_width,
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
		})
		inactive_right({
			"fileformat",
			fmt = string.lower,
			icons_enabled = false,
			cond = conditions.hide_in_width,
			color = { bg = colors.black, fg = colors.grey },
			separator = { right = "▓▒░" },
			padding = { left = 0, right = 1 },
		})
		--
		return config
	end
}
