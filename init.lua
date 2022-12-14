require("kevin")
require("plugins")
-- require("kevin.tokyonight")
-- require("kevin.gruvbox-baby")
require("kevin.gruvbox")
require("kevin.lualine")
require("base")
require("maps")
require("abbreviations")
require("augroups")
require("functions")
require("kevin.git-blame")

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("macos")
end

if is_win then
	require("windows")
end
