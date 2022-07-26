local c = require('cobalt2.colors')
local cfg = vim.g.cobalt2_config
local util = require("cobalt2.util")

local M = {}
local hl = {langs = {}, plugins = {}}

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
            group_settings.fg or "none",
            group_settings.bg or "none",
            group_settings.sp or "none",
            group_settings.fmt or "none"))
    end
end

local colors = {
    Fg = {fg = c.fg},
    LightGrey = {fg = c.light_grey},
    Grey = {fg = c.grey},
    Red = {fg = c.red},
    Cyan = {fg = c.cyan},
    Yellow = {fg = c.yellow},
    Orange = {fg = c.orange},
    Green = {fg = c.green},
    Blue = {fg = c.blue},
    Purple = {fg = c.purple}
}
hl.common = {
    Normal = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    Terminal = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    EndOfBuffer = {fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0},
    FoldColumn = {fg = c.fg, bg = cfg.transparent and c.none or c.bg1},
    Folded = {fg = c.fg, bg = cfg.transparent and c.none or c.bg1},
    SignColumn = {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    ToolbarLine = {fg = c.fg},
    Cursor = {fmt = "reverse"},
    vCursor = {fmt = "reverse"},
    iCursor = {fmt = "reverse"},
    lCursor = {fmt = "reverse"},
    CursorIM = {fmt = "reverse"},
    CursorColumn = {bg = c.bg1},
    CursorLine = {bg = c.bg1},
    ColorColumn = {bg = c.bg1},
    CursorLineNr = {fg = c.fg},
    LineNr = {fg = c.grey},
    Conceal = {fg = c.grey, bg = c.bg1},
    DiffAdd = {fg = c.none, bg = c.diff_add},
    DiffChange = {fg = c.none, bg = c.diff_change},
    DiffDelete = {fg = c.none, bg = c.diff_delete},
    DiffText = {fg = c.none, bg= c.diff_text},
    DiffAdded = colors.Green,
    DiffRemoved = colors.Red,
    DiffFile = colors.Cyan,
    DiffIndexLine = colors.Grey,
    Directory = {fg = c.blue},
    ErrorMsg = {fg = c.red, fmt = "bold"},
    WarningMsg = {fg = c.yellow, fmt = "bold"},
    MoreMsg = {fg = c.blue, fmt = "bold"},
    IncSearch = {fg = c.diff_text, bg = c.orange},
    Search = {fg = c.diff_text, bg = c.bg_yellow},
    Substitute = {fg = c.bg0, bg = c.green},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg1},
    PmenuSbar = {fg = c.none, bg = c.bg1},
    PmenuSel = {fg = c.bg0, bg = c.bg_blue},
    WildMenu = {fg = c.bg0, bg = c.blue},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.yellow},
    SpellBad = {fg = c.red, fmt = "underline", sp = c.red},
    SpellCap = {fg = c.yellow, fmt = "underline", sp = c.yellow},
    SpellLocal = {fg = c.blue, fmt = "underline", sp = c.blue},
    SpellRare = {fg = c.purple, fmt = "underline", sp = c.purple},
    StatusLine = {fg = c.bg1, bg = c.bg2},
    StatusLineTerm = {fg = c.bg1, bg = c.bg2},
    StatusLineNC = {fg = c.grey, bg = c.bg1},
    StatusLineTermNC = {fg = c.grey, bg = c.bg1},
    TabLine = {fg = c.fg, bg = c.bg1},
    TabLineFill = {fg = c.grey, bg = c.bg1},
    TabLineSel =  {fg = c.bg0, bg = c.fg},
    VertSplit = {fg = c.bg2},
    Visual = {bg = c.bg2},
    VisualNOS = {fg = c.none, bg = c.bg2, fmt = "underline"},
    QuickFixLine = {fg = c.blue, fmt = "underline"},
    Debug = {fg = c.yellow},
    debugPC = {fg = c.bg0, bg = c.green},
    debugBreakpoint = {fg = c.bg0, bg = c.red},
    ToolbarButton = {fg = c.bg0, bg = c.bg_blue},
    FloatBorder = {fg = c.grey, bg = c.bg1},
    NormalFloat = {fg = c.fg, bg = c.bg1},
}

hl.syntax = {
    String = {fg = c.green, fmt = cfg.code_style.strings},
    Character = colors.Orange,
    Number = colors.Red,
    Float = colors.Red,
    Boolean = colors.Red,
    Type = colors.Purple,
    Structure = colors.Yellow,
    StorageClass = colors.Orange,
    Identifier = {fg = c.purple, fmt = cfg.code_style.variables},
    Constant = colors.Red,
    PreProc = colors.Red,
    PreCondit = colors.Red,
    Include = colors.Cyan,
    Keyword = {fg = c.orange, fmt = cfg.code_style.keywords},
    Define = colors.Cyan,
    Typedef = {fg = c.diff_text},
    Exception = {fg = c.dark_purple},
    Conditional = {fg = c.orange, fmt = cfg.code_style.keywords},
    Repeat = {fg = c.orange, fmt = cfg.code_style.keywords},
    Statement = colors.Orange,
    Macro = colors.Cyan,
    Error = colors.Red,
    Label = colors.Orange,
    Special = colors.Orange,
    SpecialChar = colors.blue,
    Function = {fg = c.yellow, fmt = cfg.code_style.functions},
    Operator = {fg = c.diff_delete},
    Title = colors.Cyan,
    Tag = colors.Cyan,
    Delimiter = {fg = c.diff_text},
    Comment = {fg = c.blue, fmt = cfg.code_style.comments},
    SpecialComment = {fg = c.blue, fmt = cfg.code_style.comments},
    Todo = {fg = c.orange, fmt = cfg.code_style.comments}
}

hl.treesitter = {
    TSAnnotation = colors.Cyan,
    TSAttribute = colors.Yellow,
    TSBoolean = colors.Red,
    TSCharacter = colors.Red,
    TSComment = {fg = c.blue, fmt = cfg.code_style.comments},
    TSConditional = {fg = c.orange, fmt = cfg.code_style.keywords},
    TSConstant = {fg = c.light_red},
    TSConstBuiltin = {fg = c.light_green},
    TSConstMacro = colors.Cyan,
    TSConstructor = {fg = c.light_green},
    TSError = {fg = c.diff_delete},
    TSException = {fg = c.diff_delete},
    TSField = colors.Cyan,
    TSFloat = colors.Red,
    TSFunction = {fg = c.yellow, fmt = cfg.code_style.functions},
    TSFuncBuiltin = {fg = c.yellow, fmt = cfg.code_style.functions},
    TSFuncMacro = {fg = c.yellow, fmt = cfg.code_style.functions},
    TSInclude = colors.Orange,
    TSKeyword = {fg = c.yellow, fmt = cfg.code_style.keywords},
    TSKeywordFunction = {fg = c.dark_purple, fmt = cfg.code_style.functions},
    TSKeywordOperator =  {fg = c.orange, fmt = cfg.code_style.keywords},
    TSLabel = colors.Orange,
    TSMethod = colors.Yellow,
    TSNamespace = colors.Yellow,
    TSNone = colors.Fg,
    TSNumber = colors.Red,
    TSOperator = {fg = c.yellow},
    TSParameter = {fg = c.diff_text},
    TSParameterReference = colors.Fg,
    TSProperty = {fg = c.light_cyan},
    TSPunctDelimiter = colors.LightGrey,
    TSPunctBracket = colors.Yellow,
    TSPunctSpecial = colors.Purple,
    TSRepeat = {fg = c.orange, fmt = cfg.code_style.keywords},
    TSString = {fg = c.green, fmt = cfg.code_style.strings},
    TSStringRegex = {fg = c.green, fmt = cfg.code_style.strings},
    TSStringEscape = {fg = c.green, fmt = cfg.code_style.strings},
    TSSymbol = {fg = c.light_green},
    TSTagAttribute = {fg = c.yellow, fmt = 'italic'},
    TSTagDelimiter = {fg = c.diff_text},
    TSText = colors.Fg,
    TSStrong = {fg = c.fg, fmt = 'bold'},
    TSEmphasis = {fg = c.fg, fmt = 'italic'},
    TSUnderline = {fg = c.fg, fmt = 'underline'},
    TSStrike = {fg = c.fg, fmt = 'strikethrough'},
    TSTitle = {fg = c.orange, fmt = 'bold'},
    TSLiteral = colors.Green,
    TSURI = {fg = c.cyan, fmt = 'underline'},
    TSMath = colors.Fg,
    TSTextReference = colors.Blue,
    TSEnviroment = colors.Fg,
    TSEnviromentName = colors.Fg,
    TSNote = colors.Fg,
    TSWarning = colors.Fg,
    TSDanger = colors.Fg,
    TSType = {fg = c.purple, fmt = 'italic'},
    TSTypeBuiltin = {fg = c.light_green},
    TSVariable = {fg = c.diff_text},
    TSVariableBuiltin = {fg = c.diff_text},
    TSTag = colors.Cyan,
}

local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.Orange,
    LspCxxHlGroupMemberVariable = colors.Orange,
    LspCxxHlGroupNamespace = colors.Blue,
    LspCxxHlSkippedRegion = colors.Grey,
    LspCxxHlSkippedRegionBeginEnd = colors.Red,

    DiagnosticError = {fg = c.red},
    DiagnosticHint = {fg = c.purple},
    DiagnosticInfo = {fg = c.cyan},
    DiagnosticWarn = {fg = c.yellow},

    DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none,
                                   fg = diagnostics_error_color },
    DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none,
                                  fg = diagnostics_warn_color },
    DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none,
                                  fg = diagnostics_info_color },
    DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none,
                                  fg = diagnostics_hint_color },

    DiagnosticUnderlineError = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red},
    DiagnosticUnderlineHint = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple},
    DiagnosticUnderlineInfo = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue},
    DiagnosticUnderlineWarn = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow},

    LspReferenceText = { bg = c.bg2 },
    LspReferenceWrite = { bg = c.bg2 },
    LspReferenceRead = { bg = c.bg2 },

    LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
    LspCodeLensSeparator = { fg = c.grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
    ALEErrorSign = hl.plugins.lsp.DiagnosticError,
    ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
    ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
    BufferCurrent = { fmt = "bold" },
    BufferCurrentMod = { fg = c.orange,bg = c.yellow, fmt = "bold,italic" },
    BufferCurrentSign = { fg = c.purple },
    BufferInactiveMod = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
    BufferVisible = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleMod = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    BufferVisibleIndex = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleSign = { fg = c.light_grey, bg = c.bg0 },
    BufferVisibleTarget = { fg = c.light_grey, bg = c.bg0 },
}

hl.plugins.cmp = {
    CmpItemAbbr = colors.Fg,
    CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    CmpItemAbbrMatch = colors.Cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
    CmpItemMenu = colors.LightGrey,
    CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
    CocErrorSign = hl.plugins.lsp.DiagnosticError,
    CocHintSign = hl.plugins.lsp.DiagnosticHint,
    CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
    CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
    WhichKey = colors.Blue,
    WhichKeyDesc = colors.Yellow,
    WhichKeyGroup = colors.Orange,
    WhichKeySeperator = colors.Purple
}

hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.orange},
    GitGutterChange = {fg = c.yellow},
    GitGutterDelete = {fg = c.red},
}

hl.plugins.hop = {
    HopNextKey = {fg = c.red, fmt = "bold"},
    HopNextKey1 = {fg = c.cyan, fmt = "bold"},
    HopNextKey2 = {fg = util.darken(c.blue, 0.7)},
    HopUnmatched = colors.Grey,
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, fmt = "bold"},
    DiffviewFilePanelCounter = {fg = c.purple, fmt = "bold"},
    DiffviewFilePanelFileName = colors.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.Grey,
    DiffviewFilePanelPath = colors.Grey,
    DiffviewFilePanelInsertions = colors.Blue,
    DiffviewFilePanelDeletions = colors.Red,
    DiffviewStatusAdded = colors.Blue,
    DiffviewStatusUntracked = colors.Orange,
    DiffviewStatusModified = colors.Orange,
    DiffviewStatusRenamed = colors.Orange,
    DiffviewStatusCopied = colors.Orange,
    DiffviewStatusTypeChange = colors.Orange,
    DiffviewStatusUnmerged = colors.Orange,
    DiffviewStatusUnknown = colors.Red,
    DiffviewStatusDeleted = colors.Red,
    DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.Yellow,
    GitSignsAddLn = colors.Yellow,
    GitSignsAddNr = colors.Yellow,
    GitSignsChange = colors.Orange,
    GitSignsChangeLn = colors.Orange,
    GitSignsChangeNr = colors.Orange,
    GitSignsDelete = colors.Red,
    GitSignsDeleteLn = colors.Red,
    GitSignsDeleteNr = colors.Red
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeVertSplit = { fg = c.bg_blue, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeRootFolder = { fg = c.yellow, fmt = "bold" },
    NvimTreeGitDirty = colors.Yellow,
    NvimTreeGitNew = colors.Green,
    NvimTreeGitDeleted = colors.Red,
    NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
    NvimTreeIndentMarker = colors.Fg,
    NvimTreeImageFile = { fg = c.dark_purple },
    NvimTreeSymlink = colors.Purple,
    NvimTreeFolderName = { fg = c.diff_text },
}
hl.plugins.telescope = {
    TelescopeBorder = colors.Yellow,
    TelescopePromptBorder = colors.Yellow,
    TelescopeResultsBorder = colors.Yellow,
    TelescopePreviewBorder = colors.Yellow,
    TelescopeMatching = { fg = c.diff_text, fmt = "bold" },
    TelescopePromptPrefix = colors.Orange,
    TelescopeSelection =  { bg =c.bg2 },
    TelescopeSelectionCaret = colors.Yellow
}

hl.plugins.dashboard = {
    DashboardShortCut = colors.Orange,
    DashboardHeader = colors.Yellow,
    DashboardCenter = colors.Cyan,
    DashboardFooter = { fg = c.dark_red, fmt = "italic"}
}

hl.plugins.outline = {
    FocusedSymbol = { fg = c.purple, bg = c.bg2, fmt = "bold" },
    AerialLine = { fg = c.purple, bg = c.bg2, fmt = "bold" },
}

hl.plugins.ts_rainbow = {
    rainbowcol1 = colors.Grey,
    rainbowcol2 = colors.Yellow,
    rainbowcol3 = colors.Grey,
    rainbowcol4 = colors.Orange,
    rainbowcol5 = colors.Purple,
    rainbowcol6 = colors.Yellow,
    rainbowcol7 = colors.Green
}

hl.plugins.mini = {
    MiniCompletionActiveParameter = { fmt = "underline" },

    MiniCursorword = { fmt = "underline" },
    MiniCursorwordCurrent = { fmt = "underline" },

    MiniIndentscopeSymbol = { fg = c.light_grey },
    MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

    MiniJump = { fg = c.purple, fmt = "underline", sp = c.purple },

    MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },

    MiniStarterCurrent = { fmt = "nocombine" },
    MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
    MiniStarterHeader = colors.Yellow,
    MiniStarterInactive = { fg = c.grey, fmt = cfg.code_style.comments },
    MiniStarterItem = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    MiniStarterItemBullet = { fg = c.grey },
    MiniStarterItemPrefix = { fg = c.yellow },
    MiniStarterSection = colors.LightGrey,
    MiniStarterQuery = { fg = c.cyan },

    MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg2 },
    MiniStatuslineFilename = { fg = c.grey, bg = c.bg1 },
    MiniStatuslineInactive = { fg = c.grey, bg = c.bg0 },
    MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
    MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, fmt = "bold" },
    MiniStatuslineModeNormal = { fg = c.bg0, bg = c.green, fmt = "bold" },
    MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyen, fmt = "bold" },
    MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, fmt = "bold" },
    MiniStatuslineModeVisual = { fg = c.bg0, bg = c.purple, fmt = "bold" },

    MiniSurround = { fg = c.bg0, bg = c.orange },

    MiniTablineCurrent = { fmt = "bold" },
    MiniTablineFill = { fg = c.grey, bg = c.bg1 },
    MiniTablineHidden = { fg = c.fg, bg = c.bg1 },
    MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
    MiniTablineModifiedHidden = { fg = c.light_grey, bg = c.bg1, fmt = "italic" },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
    MiniTablineTabpagesection = { fg = c.bg0, bg = c.bg_yellow },
    MiniTablineVisible = { fg = c.light_grey, bg = c.bg0 },

    MiniTestEmphasis = { fmt = "bold" },
    MiniTestFail = { fg = c.red, fmt = "bold" },
    MiniTestPass = { fg = c.green, fmt = "bold" },

    MiniTrailspace = { bg = c.red },
}

hl.langs.c = {
    cInclude = colors.Orange,
    cStorageClass = colors.Purple,
    cTypedef = colors.Purple,
    cDefine = colors.Cyan,
    cTSInclude = colors.Orange,
    cTSConstant = colors.Cyan,
    cTSConstMacro = colors.Purple,
    cTSOperator = colors.Purple,
}

hl.langs.cpp = {
    cppStatement = { fg = c.purple, fmt = "bold" },
    cppTSInclude = colors.Orange,
    cppTSConstant = colors.Cyan,
    cppTSConstMacro = colors.Purple,
    cppTSOperator = colors.Purple,
}

hl.langs.markdown = {
    markdownBlockquote = colors.Grey,
    markdownBold = {fg = c.none, fmt = "bold"},
    markdownBoldDelimiter = colors.Grey,
    markdownCode = colors.Blue,
    markdownCodeBlock = colors.Blue,
    markdownCodeDelimiter = colors.Yellow,
    markdownH1 = {fg = c.red, fmt = "bold"},
    markdownH2 = {fg = c.purple, fmt = "bold"},
    markdownH3 = {fg = c.orange, fmt = "bold"},
    markdownH4 = {fg = c.red, fmt = "bold"},
    markdownH5 = {fg = c.purple, fmt = "bold"},
    markdownH6 = {fg = c.orange, fmt = "bold"},
    markdownHeadingDelimiter = colors.Grey,
    markdownHeadingRule = colors.Grey,
    markdownId = colors.Yellow,
    markdownIdDeclaration = colors.Red,
    markdownItalic = {fg = c.none, fmt = "italic"},
    markdownItalicDelimiter = {fg = c.grey, fmt = "italic"},
    markdownLinkDelimiter = colors.Grey,
    markdownLinkText = colors.Red,
    markdownLinkTextDelimiter = colors.Grey,
    markdownListMarker = colors.Red,
    markdownOrderedListMarker = colors.Red,
    markdownRule = colors.Purple,
    markdownUrl = {fg = c.blue, fmt = "underline"},
    markdownUrlDelimiter = colors.Grey,
    markdownUrlTitleDelimiter = colors.Blue
}

hl.langs.php = {
    phpFunctions = {fg = c.fg, fmt = cfg.code_style.functions},
    phpMethods = colors.Cyan,
    phpStructure = colors.Purple,
    phpOperator = colors.Purple,
    phpMemberSelector = colors.Fg,
    phpVarSelector = {fg = c.orange, fmt = cfg.code_style.variables},
    phpIdentifier = {fg = c.orange, fmt = cfg.code_style.variables},
    phpBoolean = colors.Cyan,
    phpNumber = colors.Orange,
    phpHereDoc = colors.Blue,
    phpNowDoc = colors.Blue,
    phpSCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
    phpFCKeyword = {fg = c.purple, fmt = cfg.code_style.keywords},
    phpRegion = colors.Orange
}

hl.langs.scala = {
    scalaNameDefinition = colors.Fg,
    scalaInterpolationBoundary = colors.Purple,
    scalaInterpolation = colors.Purple,
    scalaTypeOperator = colors.Red,
    scalaOperator = colors.Red,
    scalaKeywordModifier = {fg = c.red, fmt = cfg.code_style.keywords},
}

hl.langs.tex = {
    latexTSInclude = colors.Orange,
    latexTSFuncMacro = {fg = c.fg, fmt = cfg.code_style.functions},
    latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
    latexTSEnvironmentName = colors.Yellow,
    texCmdEnv = colors.Cyan,
    texEnvArgName = colors.Yellow,
    latexTSTitle = colors.Blue,
    latexTSType = colors.Orange,
    latexTSMath   = colors.Orange,
    texMathZoneX  = colors.Orange,
    texMathZoneXX = colors.Orange,
    texMathDelimZone = colors.LightGrey,
    texMathDelim = colors.Purple,
    texMathOper = colors.Red,
    texCmd = colors.Purple,
    texCmdPart = colors.Orange,
    texCmdPackage = colors.Orange,
    texPgfType = colors.Yellow,
}

hl.langs.vim = {
    vimOption = colors.Red,
    vimSetEqual = colors.Yellow,
    vimMap = colors.Purple,
    vimMapModKey = colors.Orange,
    vimNotation = colors.Red,
    vimMapLhs = colors.Fg,
    vimMapRhs = colors.Orange,
    vimVar = {fg = c.fg, fmt = cfg.code_style.variables},
    vimCommentTitle = {fg = c.light_grey, fmt = cfg.code_style.comments},
}

local lsp_kind_icons_color = {
    Default = c.purple,
    Class = c.yellow,
    Color = c.green,
    Constant = c.orange,
    Constructor = c.yellow,
    Enum = c.green,
    EnumMember = c.yellow,
    Event = c.yellow,
    Field = c.purple,
    File = c.yellow,
    Folder = c.orange,
    Function = c.dark_purple,
    Interface = c.purple,
    Keyword = c.orange,
    Method = c.yellow,
    Module = c.orange,
    Operator = c.orange,
    Property = c.cyan,
    Reference = c.orange,
    Snippet = c.diff_text,
    Struct = c.light_green,
    Text = c.diff_text,
    TypeParameter = c.purple,
    Unit = c.green,
    Value = c.diff_text,
    Variable = c.yellow,
}

function M.setup()
    -- define cmp and aerial kind highlights with lsp_kind_icons_color
    for kind, color in pairs(lsp_kind_icons_color) do
        hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
        hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then return "" end
        if color_name:sub(1, 1) == '$' then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify('cobalt2.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "cobalt2.nvim" })
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.cobalt2_config.highlights) do
        vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
            replace_color("guifg", group_settings.fg),
            replace_color("guibg", group_settings.bg),
            replace_color("guisp", group_settings.sp),
            replace_color("gui", group_settings.fmt)))
    end
end

return M
