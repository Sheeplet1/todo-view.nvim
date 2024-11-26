local M = {}
local config = require("todo-view.config")
local ui = require("todo-view.ui")

M.setup = config.setup
M.toggle_float = ui.toggle_float

function M.reset()
	M.close()
	require("todo-view").toggle_float()
end

return M
