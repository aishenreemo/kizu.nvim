local function get_darker_color(color, hex)
    local t = tostring(color)
    local s = string.sub(t, 2, 7)
    local after_color = tonumber("0x" .. s) - hex
    local final_color = "#" .. string.format("%x", after_color)
    return final_color
end


local kizu = {
    foreground    = "#C5C8C9",
    background    = "#0B0F10",
    black         = "#131718",
    red           = "#DF5B61",
    green         = "#87C7A1",
    orange        = "#DE8F78",
    blue          = "#6791C9",
    violet        = "#BC83E3",
    cyan          = "#70B9CC",
    white         = "#C4C4C4",
    bright_black  = "#151A1C",
    bright_red    = "#EE6A70",
    bright_green  = "#96D6B0",
    bright_orange = "#FFB29B",
    bright_blue   = "#7BA5DD",
    bright_violet = "#CB92F2",
    bright_cyan   = "#7FC8DB",
    bright_white  = "#CCCCCC",
    none          = "NONE",
    grey          = get_darker_color("#C5C8C9", 0x363940),
}


function kizu.terminal_color()
    vim.g.terminal_color_0  = kizu.background
    vim.g.terminal_color_1  = kizu.red
    vim.g.terminal_color_2  = kizu.green
    vim.g.terminal_color_3  = kizu.orange
    vim.g.terminal_color_4  = kizu.blue
    vim.g.terminal_color_5  = kizu.violet
    vim.g.terminal_color_6  = kizu.cyan
    vim.g.terminal_color_7  = kizu.foreground
    vim.g.terminal_color_8  = kizu.background
    vim.g.terminal_color_9  = kizu.red
    vim.g.terminal_color_10 = kizu.green
    vim.g.terminal_color_11 = kizu.orange
    vim.g.terminal_color_12 = kizu.blue
    vim.g.terminal_color_13 = kizu.violet
    vim.g.terminal_color_14 = kizu.cyan
    vim.g.terminal_color_15 = kizu.foreground
end

function kizu.highlight(group, color)
    local style = color.style and "gui=" .. color.style .. " " or "gui=NONE "
    local fg = color.fg and "guifg=" .. color.fg .. " " or "guifg=NONE "
    local bg = color.bg and "guibg=" .. color.bg .. " " or "guibg=NONE "
    local sp = color.sp and "guisp=" .. color.sp or ""

    vim.api.nvim_command("highlight " .. group .. " " .. style .. fg .. bg .. sp)
end

function kizu.load_syntax()
    local syntax = {
        -- ==================
        -- Syntax group
        -- ===================
        Boolean = { fg = kizu.orange },
        Comment = { fg = kizu.grey },
        Constant = { fg = kizu.cyan },
        Character = { fg = kizu.green },
        Conditional = { fg = kizu.violet },
        Debug = {},
        Define = { fg = kizu.violet },
        Delimiter = {},
        Error = { fg = kizu.red },
        Exception = { fg = kizu.violet },
        Float = { fg = kizu.orange },
        Function = { fg = kizu.blue },
        Identifier = { fg = kizu.red },
        Ignore = {},
        Include = { fg = kizu.blue },
        Keyword = { fg = kizu.red },
        Label = { fg = kizu.violet },
        Macro = { fg = kizu.violet },
        Number = { fg = kizu.orange },
        Operator = { fg = kizu.violet },
        PreProc = { fg = kizu.orange },
        PreCondit = { fg = kizu.orange },
        Repeat = { fg = kizu.violet },
        Statement = { fg = kizu.violet },
        StorageClass = { fg = kizu.orange },
        Special = { fg = kizu.blue },
        SpecialChar = { fg = kizu.orange },
        Structure = { fg = kizu.orange },
        String = { fg = kizu.green },
        SpecialComment = { fg = kizu.grey },
        Typedef = { fg = kizu.orange },
        Tag = {},
        Type = { fg = kizu.orange },
        Todo = { fg = kizu.violet },
        Underlined = { fg = kizu.none, style = "underline" },

        -- =============
        -- Treesitter
        -- ==============
        TSError = { fg = kizu.red },
        TSPunctDelimitter = { fg = kizu.cyan },
        TSPunctBracket = {},
        TSPunctSpecial = { fg = kizu.cyan },
        TSConstant = { fg = kizu.orange },
        TSConstBuiltin = { fg = kizu.blue },
        TSContMacro = { fg = kizu.violet },
        TSString = { fg = kizu.green },
        TSStringRegex = { fg = kizu.red },
        TSCharacter = { fg = kizu.green },
        TSNumber = { fg = kizu.orange },
        TSBoolean = { fg = kizu.orange },
        TSFloat = { fg = kizu.orange },
        TSAnnotation = { fg = kizu.blue },
        TSAttribute = { fg = kizu.orange },
        TSNamespace = { fg = kizu.blue },
        TSFunctionBuiltin = { fg = kizu.blue },
        TSFunction = { fg = kizu.blue },
        TSFuncMacro = { fg = kizu.blue },
        TSParameter = { fg = kizu.red },
        TSParameterReference = { fg = kizu.red },
        TSMethod = { fg = kizu.blue },
        TSField = { fg = kizu.orange },
        TSProperty = { fg = kizu.red },
        TSConstructor = { fg = kizu.blue },
        TSConditional = { fg = kizu.violet },
        TSRepeat = { fg = kizu.violet },
        TSLabel = { fg = kizu.violet },
        TSKeyword = { fg = kizu.violet },
        TSKeywordFunction = { fg = kizu.violet },
        TSKeywordOperator = { fg = kizu.cyan },
        TSOperator = { fg = kizu.cyan },
        TSExeption = { fg = kizu.red },
        TSType = { fg = kizu.blue },
        TSTypeBuiltin = { fg = kizu.red },
        TSStructure = { fg = kizu.orange },
        TSInclude = { fg = kizu.red },
        TSVariable = { fg = kizu.orange },
        TSVariableBuiltin = { fg = kizu.blue },
        TSText = {},
        TSStrong = { fg = kizu.violet },
        TSEmphasis = { fg = kizu.cyan },
        TSUnderline = { fg = kizu.orange },
        TSTitle = { fg = kizu.orange },
        TSLiteral = { fg = kizu.green },
        TSUri = { fg = kizu.green },
        TSTag = {},
        TSTagDelimitter = {},

        -- ===================
        -- Highlight Group
        -- ===================
        BufferInactive = { fg = kizu.foreground, bg = kizu.bright_black },
        BufferInactiveTarge = { fg = kizu.foreground, bg = kizu.bright_black },
        BufferInactiveSign = { fg = kizu.blue, bg = kizu.bright_black },
        BufferCurrent = { fg = kizu.orange, bg = kizu.background, style = "bold" },
        BufferCurrentSign = { fg = kizu.blue, bg = kizu.background },
        BufferTabPageFill = { fg = kizu.blue, bg = kizu.background },
        BufferCurrentMod = { fg = kizu.blue, bg = kizu.background },
        BufferInactiveMod = { fg = kizu.blue, bg = kizu.bright_black },
        ColorColumn = { fg = kizu.none, bg = kizu.bright_black },
        Conceal = { fg = kizu.bright_black, bg = kizu.none },
        CursorLineNr = { fg = kizu.blue },
        CursorIM = { fg = kizu.none, bg = kizu.none, style = "reverse" },
        CursorColumn = { fg = kizu.none, bg = kizu.bright_black },
        CursorLine = { fg = kizu.none, bg = kizu.bright_black },
        Cursor = { fg = kizu.none, bg = kizu.none, style = "reverse" },
        DiagnosticError = { fg = kizu.red },
        DiagnosticWarn = { fg = kizu.orange },
        DiagnosticInfo = { fg = kizu.bright_blue },
        DiagnosticHint = { fg = kizu.bright_white },
        DiagnosticOk = { fg = kizu.bright_green },
        DiffAdd = { fg = kizu.background, bg = kizu.green },
        DiffChange = { fg = kizu.background, bg = kizu.orange },
        DiffDelete = { fg = kizu.background, bg = kizu.red },
        DiffText = { fg = kizu.background, bg = kizu.foreground },
        Directory = { fg = kizu.grey, bg = kizu.none },
        debugBreakpoint = { fg = kizu.background, bg = kizu.red },
        EndOfBuffer = { fg = kizu.background, bg = kizu.none },
        ErrorMsg = { fg = kizu.red, bg = kizu.none, style = "bold" },
        FoldColumn = { fg = kizu.foreground, bg = kizu.background },
        Folded = { fg = kizu.bright_black, bg = kizu.bright_black },
        FloatShadow = { bg = kizu.black },
        FloatShadowThrough = { bg = kizu.black },
        iCursor = { fg = kizu.none, bg = kizu.none, style = "reverse" },
        IncSearch = { fg = kizu.grey, bg = kizu.orange, style = kizu.none },
        lCursor = { fg = kizu.none, bg = kizu.none, style = "reverse" },
        LineNr = { fg = kizu.bright_black },
        ModeMsg = { fg = kizu.foreground, bg = kizu.none, style = "bold" },
        MatchParen = { fg = kizu.red, bg = kizu.none },
        Normal = { fg = kizu.foreground, bg = kizu.background },
        NormalFloat = { fg = kizu.foreground, bg = kizu.grey },
        NonText = { fg = kizu.bright_black },
        Pmenu = { fg = kizu.foreground, bg = kizu.bright_black },
        PmenuSel = { fg = kizu.bright_black, bg = kizu.blue },
        PmenuSelBold = { fg = kizu.bright_black, g = kizu.blue },
        PmenuSbar = { fg = kizu.none, bg = kizu.bright_black },
        PmenuThumb = { fg = kizu.violet, bg = kizu.green },
        Question = { fg = kizu.orange },
        QuickFixLine = { fg = kizu.violet, style = "bold" },
        RedrawDebugClear = { bg = kizu.orange },
        StatusLine = { fg = kizu.bright_black, bg = kizu.bright_black, style = kizu.none },
        StatusLineNC = { fg = kizu.bright_black, bg = kizu.bright_black, style = kizu.none },
        SpellBad = { fg = kizu.red, bg = kizu.none, style = "undercurl" },
        SpellCap = { fg = kizu.blue, bg = kizu.none, style = "undercurl" },
        SpellLocal = { fg = kizu.cyan, bg = kizu.none, style = "undercurl" },
        SpellRare = { fg = kizu.violet, bg = kizu.none, style = "undercurl" },
        SignColumn = { fg = kizu.foreground, bg = kizu.background },
        Search = { fg = kizu.background, bg = kizu.orange },
        SpecialKey = { fg = kizu.bright_black },
        TabLineSel = { bg = kizu.background },
        Title = { fg = kizu.green, style = "bold" },
        Terminal = { fg = kizu.foreground, bg = kizu.background },
        TabLineFill = { style = kizu.none },
        VertSplit = { fg = kizu.bright_black, bg = kizu.bright_black },
        vCursor = { fg = kizu.none, bg = kizu.none, style = "reverse" },
        WarningMsg = { fg = kizu.orange, bg = kizu.none, style = "bold" },
        Whitespace = { fg = kizu.bright_black },
        WildMenu = { fg = kizu.foreground, bg = kizu.green },
        Visual = { fg = kizu.none, bg = kizu.bright_black },
        VisualNOS = { fg = kizu.background, bg = kizu.foreground },
    }
    return syntax
end

-- ================================
-- Language specific highlighting
-- ================================
function kizu.load_plugin_syntax()
    local plugin_syntax = {
        -- =========================
        -- Neovim LSP
        -- =========================
        LspDiagnosticsError                  = { fg = kizu.red },
        LspDiagnosticsWarning                = { fg = kizu.orange },
        LspDiagnosticsInformation            = { fg = kizu.green },
        LspDiagnosticsHint                   = { fg = kizu.cyan },
        LspDiagnosticsSignError              = { fg = kizu.red },
        LspDiagnosticsSignWarning            = { fg = kizu.orange },
        LspDiagnosticsSignInformation        = { fg = kizu.blue },
        LspDiagnosticsSignHint               = { fg = kizu.cyan },
        LspDiagnosticsVirtualTextError       = { fg = kizu.red },
        LspDiagnosticsVirtualTextWarning     = { fg = kizu.orange },
        LspDiagnosticsVirtualTextInformation = { fg = kizu.green },
        LspDiagnosticsVirtualTextHint        = { fg = kizu.cyan },
        LspDiagnosticsUnderlineError         = { style = "undercurl", sp = kizu.red },
        LspDiagnosticsUnderlineWarning       = { style = "undercurl", sp = kizu.orange },
        LspDiagnosticsUnderlineInformation   = { style = "undercurl", sp = kizu.green },
        LspDiagnosticsUnderlineHint          = { style = "undercurl", sp = kizu.cyan },
        -- ===============
        -- vim-cursorword
        -- ===============
        CursorWord0                          = { bg = kizu.grey },
        CursorWord1                          = { bg = kizu.grey },
        -- ==================
        -- Nvim Tree
        -- ==================
        NvimTreeEmptyFolderName              = { fg = kizu.cyan },
        NvimTreeOpenedFolderName             = { fg = kizu.cyan },
        NvimTreeFolderName                   = { fg = kizu.cyan },
        NvimTreeExecFile                     = { style = "NONE" },
        NvimTreeGitNew                       = { fg = kizu.orange },
        NvimTreeGitDirty                     = { fg = kizu.orange },
        NvimTreeGitMerge                     = { fg = kizu.orange },
        NvimTreeGitRenamed                   = { fg = kizu.violet },
        NvimTreeRootFolder                   = { fg = kizu.red },
        NvimTreeSpecialFile                  = { fg = kizu.white, bg = kizu.none, style = "italic" },
        NvimTreeFolderIcon                   = { fg = kizu.orange },
        -- ==================
        -- Telescope Nvim
        -- ==================
        TelescopeBorder                      = { fg = kizu.cyan },
        TelescopePromptBorder                = { fg = kizu.blue },
    }

    return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
    for group, colors in pairs(kizu.load_plugin_syntax()) do
        kizu.highlight(group, colors)
    end
    async_load_plugin:close()
end))

function kizu.colorscheme()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "kizu"
    kizu.terminal_color()
    for group, colors in pairs(kizu.load_syntax()) do
        kizu.highlight(group, colors)
    end

    async_load_plugin:send()
end

kizu.colorscheme()

return kizu
