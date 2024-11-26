--- @class TodoConfig
local M = {}

--- @class TodoOptions
local defaults = function()
	local curr_win = vim.api.nvim_get_current_win()
	local width = math.floor(vim.api.nvim_win_get_width(curr_win) * 0.9)
	local height = math.floor(vim.api.nvim_win_get_height(curr_win) * 0.8)
	local gwidth = vim.api.nvim_list_uis()[1].width
	local gheight = vim.api.nvim_list_uis()[1].height

	return {
		window = {
			height = height,
			width = width,
			-- Centres the TODO window
			row = (gheight - height) * 0.5,
			col = (gwidth - width) * 0.5,
			border = "rounded",
		},
	}
end

--- @type TodoOptions
M.options = nil

function M.setup(options)
	-- Set options
	M.options = vim.tbl_deep_extend("force", {}, defaults(), options or {})
end

return M
