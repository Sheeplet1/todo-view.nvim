local M = {}

function M.open_float()
	local config = require("todo-view.config")
	local utils = require("todo-view.utils")

	local todo_file_path = utils.find_todo_file(vim.fn.getcwd())

	if todo_file_path then
		local width = config.options.window.width
		local height = config.options.window.height
		local row = config.options.window.row
		local col = config.options.window.col

		local abs_todo_path = vim.fn.fnamemodify(todo_file_path, ":p")

		local bufnr = vim.fn.bufadd(todo_file_path)
		vim.fn.bufload(bufnr)
		vim.bo[bufnr].bufhidden = "wipe"

		local original_winid = vim.api.nvim_get_current_win()
		local winid = vim.api.nvim_open_win(bufnr, true, {
			relative = "editor",
			row = row,
			col = col,
			width = width,
			height = height,
			border = "rounded",
			style = "minimal",
			title = abs_todo_path,
			title_pos = "left",
		})

		vim.w[winid].is_todo_win = true
		vim.w[winid].todo_original_win = original_winid
	else
		error("TODO.md not found. Create TODO.md in the project's source directory.")
	end
end

function M.toggle_float()
	if vim.w.is_todo_win then
		M.close()
	else
		M.open_float()
	end
end

function M.close()
	-- If we are in a floating window, try to close and restore focus to the
	-- original window
	if vim.w.is_todo_win then
		local original_winid = vim.w.todo_original_win
		vim.api.nvim_win_close(0, true)
		if original_winid and vim.api.nvim_win_is_valid(original_winid) then
			vim.api.nvim_set_current_win(original_winid)
		end
		return
	end
end

return M
