-- lua/config/latex_mathzone.lua
-- Detector simple: true si el cursor está dentro de $...$ o $$...$$ en la línea actual.
-- Funciona bien para el caso típico de "inline math" y muchas expresiones.
local M = {}

function M.in_mathzone()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""
	local before = line:sub(1, col)
	local after = line:sub(col + 1)

	-- Cuenta $ antes/después (inline)
	local function count_dollars(s)
		local _, n = s:gsub("%$", "")
		return n
	end

	-- Si estás en $$ ... $$ suele haber 2 dólares
	-- Simplificación: si hay un número impar de $ antes y un número impar después, probablemente estás dentro.
	local b = count_dollars(before)
	local a = count_dollars(after)

	if (b % 2 == 1) and (a % 2 == 1) then
		return true
	end

	-- Caso $$ ... $$ en la misma línea: busca pares $$ antes/después
	local bb = select(2, before:gsub("%$%$", ""))
	local aa = select(2, after:gsub("%$%$", ""))

	if (bb % 2 == 1) and (aa % 2 == 1) then
		return true
	end

	return false
end

return M
