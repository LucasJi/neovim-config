-- Reload neovim
local M = {}

function M.reloadConfig()
	-- code
	-- local hls_status = vim.v.hlsearch
	for name, _ in pairs(package.loaded) do
		if name:match("^user") then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	-- if hls_status == 0 then
	-- 	vim.opt.hlsearch = false
	-- end
end

return M
