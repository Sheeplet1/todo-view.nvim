local ui = require("todo.ui")

--- @class TodoConfig
local M = {}

--- @type TodoOptions
M.options = {}

local curr_win = vim.api.nvim_get_current_win()
local width = math.floor(vim.api.nvim_win_get_width(curr_win) * 0.9)
local height = math.floor(vim.api.nvim_win_get_height(curr_win) * 0.8)
local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height

--- @class TodoOptions
defaults = {
	window = {
		height = height,
		width = width,
		-- Centres the TODO window
		row = (gheight - height) * 0.5,
		col = (gwidth - width) * 0.5,
		border = "rounded",
	},
}

function M.setup()
	-- Set options
	M.options = vim.tbl_deep_extend("force", {}, defaults, M.options or {})

	-- Set default keybinds
	vim.keymap.set("n", "<leader>td", function()
		ui.toggle_float()
	end, { desc = "Toggle todo list" })
end

return M
