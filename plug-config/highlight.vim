lua << EOF
local white         = "#abb2bf"
local black         = "#1e222a"
local black2        = "#252931"
local one_bg        = "#282c34"
local one_bg2       = "#353b45"
local one_bg3       = "#30343c"
local grey          = "#42464e"
local grey_fg       = "#565c64"
local grey_fg2      = "#6f737b"
local light_grey    = "#6f737b"
local red           = "#d47d85"
local baby_pink     = "#DE8C92"
local pink          = "#ff75a0"
local line          = "#2a2e36"
local green         = "#A3BE8C"
local vibrant_green = "#7eca9c"
local nord_blue     = "#81A1C1"
local blue          = "#61afef"
local yellow        = "#e7c787"
local sun           = "#EBCB8B"
local purple        = "#b4bbc8"
local dark_purple   = "#c882e7"
local teal          = "#519ABA"
local orange        = "#fca2aa"
local cyan          = "#a3b8ef"
local statusline_bg = "#22262e"
local lightbg       = "#2d3139"
local lightbg2      = "#262a32"


local cmd = vim.cmd
local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- blankline

fg("IndentBlanklineChar", line)

-- misc --
fg("LineNr", grey)
fg("Comment", grey)
fg("NvimInternalError", red)
fg("VertSplit", line)
fg("EndOfBuffer", black)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", green)
bg("PmenuThumb", nord_blue)

-- inactive statuslines as thin splitlines
cmd("hi! StatusLineNC gui=underline guifg=" .. line)

-- line n.o
cmd "hi clear CursorLine"
fg("cursorlinenr", white)

-- git signs ---
fg_bg("DiffAdd", nord_blue, "none")
fg_bg("DiffChange", one_bg2, "none")
fg_bg("DiffModified", nord_blue, "none")

-- bufferline

fg_bg("BufferLineFill", grey_fg, black2)
fg_bg("BufferLineBackground", light_grey, black2)

fg_bg("BufferLineBufferVisible", light_grey, black2)
fg_bg("BufferLineBufferSelected", white, black)

cmd "hi BufferLineBufferSelected gui=bold"

-- tabs
fg_bg("BufferLineTab", light_grey, one_bg3)
fg_bg("BufferLineTabSelected", black2, nord_blue)
fg_bg("BufferLineTabClose", red, black)

fg_bg("BufferLineIndicator", black2, black2)
fg_bg("BufferLineIndicatorSelected", black, black)

-- separators
fg_bg("BufferLineSeparator", black2, black2)
fg_bg("BufferLineSeparatorVisible", black2, black2)
fg_bg("BufferLineSeparatorSelected", black, black2)

-- modified buffers
fg_bg("BufferLineModified", red, black2)
fg_bg("BufferLineModifiedVisible", red, black2)
fg_bg("BufferLineModifiedSelected", green, black)

-- close buttons
fg_bg("BufferLineCLoseButtonVisible", light_grey, black2)
fg_bg("BufferLineCLoseButton", light_grey, black2)
fg_bg("BufferLineCLoseButtonSelected", red, black)

EOF