local M = {}

function M.find_todo_file(path)
	-- TODO: Case insensitive search and diff formats
	local todo_file_name = "TODO.md"

	local todo_path = vim.fn.findfile(todo_file_name, path .. ";")

	-- If findfile returns an empty string, the file was not found
	if todo_path == "" then
		return nil
	end

	return todo_path
end

return M
