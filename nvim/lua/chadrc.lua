-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gatekeeper",

  --
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- nvim-tree on right side
M.ui = {
  tabufline = {
    order = {"buffers", "tabs", "btns", "treeOffset"}
  },
  transparency = true,
  statusline = {
     theme = "default", 
     separator_style = "default",
   },
 }

-- Dash active
M.nvdash = {
  load_on_startup = true,
}

return M
