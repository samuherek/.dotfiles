local ns = vim.api.nvim_create_namespace("requiredfield")
local all_diags = {}
-- hardcoded for testing right now
local vettool = "/Users/beatbox/third-party/requiredfield/requiredfield"

local debounce_timer = nil
local function debounce(fn, timeout)
	return function()
		if debounce_timer then
			debounce_timer:stop()
			debounce_timer:close()
		end

		debounce_timer = vim.loop.new_timer()
		debounce_timer:start(
			timeout,
			0,
			vim.schedule_wrap(function()
				debounce_timer:stop()
				debounce_timer:close()
				debounce_timer = nil
				fn()
			end)
		)
	end
end

local function parse_line(line)
	local file, l, c, msg = line:match("^(.-%.go):(%d+):(%d+):%s*(.*)$")
	if file then
		file = vim.fn.fnamemodify(file, ":p")
		return file, tonumber(l), tonumber(c), msg
	end
	return nil
end

local function apply_diags_to_buffer(bufnr)
	local file = vim.api.nvim_buf_get_name(bufnr)
	local diags = all_diags[file]

	-- vim.print(file)
	-- vim.print(all_diags)

	if diags then
		vim.diagnostic.set(ns, bufnr, diags)
	else
		local bn = vim.fn.bufnr(file, true)
		vim.diagnostic.set(ns, bn, {})
	end
end

local function apply_diags_to_all_buffers()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) then
			apply_diags_to_buffer(buf)
		end
	end
end

local function run_vet_now()
	vim.fn.jobstart({ "go", "vet", "-vettool=" .. vettool, "./..." }, {
		stdout_buffered = false,
		stderr_buffered = true,
		on_stderr = function(_, data)
			if not data then
				return
			end

			all_diags = {} -- reset global store
			--vim.diagnostic.reset(ns)

			for _, line in ipairs(data) do
				if line:match("%.go:%d+:%d+:") then
					local file, l, c, msg = parse_line(line)
					if file then
						all_diags[file] = all_diags[file] or {}
						local bufnr = vim.fn.bufnr(file, true)
						table.insert(all_diags[file], {
							lnum = l - 1,
							col = c - 1,
							message = msg,
							severity = vim.diagnostic.severity.ERROR,
							source = "requiredfield",
						})
						vim.diagnostic.set(ns, bufnr, all_diags[file])
					end
				end
			end

			apply_diags_to_all_buffers()
		end,
	})
end

local run_vet = debounce(run_vet_now, 300)

vim.api.nvim_create_autocmd({ "BufReadPost", "BufEnter" }, {
	pattern = "*.go",
	callback = function(ev)
		apply_diags_to_buffer(ev.buf)
	end,
})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.go",
	callback = run_vet,
})
