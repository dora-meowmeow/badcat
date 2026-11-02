" Badcat
" a Badwolf fork
" The original comments piss me off so I removed them all

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

highlight clear
set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "badcat"

if !exists("g:badcat_html_link_underline")
    let g:badwolf_html_link_underline = 1
endif

if !exists("g:badcat_css_props_highlight")
    let g:badwolf_css_props_highlight = 0
endif


let s:bwc = {}

let s:bwc.plain = ['f8f6f2', 15]
let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]
let s:bwc.brightgravel   = ['d9cec3', 252]
let s:bwc.lightgravel    = ['998f84', 245]
let s:bwc.gravel         = ['857f78', 243]
let s:bwc.mediumgravel   = ['666462', 241]
let s:bwc.deepgravel     = ['45413b', 238]
let s:bwc.deepergravel   = ['35322d', 236]
let s:bwc.darkgravel     = ['242321', 235]
let s:bwc.blackgravel    = ['1c1b1a', 233]
let s:bwc.blackestgravel = ['141413', 232]
let s:bwc.dalespale = ['fade3e', 221]
let s:bwc.dirtyblonde = ['f4cf86', 222]
let s:bwc.taffy = ['ff2c4b', 196]
let s:bwc.saltwatertaffy = ['8cffba', 121]
let s:bwc.tardis = ['0a9dff', 39]
let s:bwc.orange = ['ffa724', 214]
let s:bwc.lime = ['aeee00', 154]
let s:bwc.dress = ['ff9eb8', 211]
let s:bwc.toffee = ['b88853', 137]
let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}
" Configuration Options {{{

if exists('g:badwolf_darkgutter') && g:badwolf_darkgutter
    let s:gutter = 'blackestgravel'
else
    let s:gutter = 'blackgravel'
endif

if exists('g:badwolf_tabline')
    if g:badwolf_tabline == 0
        let s:tabline = 'blackestgravel'
    elseif  g:badwolf_tabline == 1
        let s:tabline = 'blackgravel'
    elseif  g:badwolf_tabline == 2
        let s:tabline = 'darkgravel'
    elseif  g:badwolf_tabline == 3
        let s:tabline = 'deepgravel'
    else
        let s:tabline = 'blackestgravel'
    endif
else
    let s:tabline = 'blackgravel'
endif

" Actual colorscheme ----------------------------------------------------------
" General/UI

call s:HL('Normal', 'plain', 'blackgravel')
call s:HL('Folded', 'mediumgravel', 'bg', 'none')
call s:HL('VertSplit', 'lightgravel', 'bg', 'none')
call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', 'darkgravel')
call s:HL('TabLine', 'plain', s:tabline, 'none')
call s:HL('TabLineFill', 'plain', s:tabline, 'none')
call s:HL('TabLineSel', 'coal', 'tardis', 'none')
call s:HL('MatchParen', 'dalespale', 'darkgravel', 'bold')
call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')
call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')
call s:HL('Search',    'coal', 'dalespale', 'bold')
call s:HL('IncSearch', 'coal', 'tardis',    'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine',   'coal', 'tardis',     'bold')
call s:HL('StatusLineNC', 'snow', 'deepgravel', 'bold')
call s:HL('Directory', 'dirtyblonde', '', 'bold')
call s:HL('Title', 'lime')
call s:HL('ErrorMsg',   'taffy',       'bg', 'bold')
call s:HL('MoreMsg',    'dalespale',   '',   'bold')
call s:HL('ModeMsg',    'dirtyblonde', '',   'bold')
call s:HL('Question',   'dirtyblonde', '',   'bold')
call s:HL('WarningMsg', 'dress',       '',   'bold')
call s:HL('Tag', '', '', 'bold')
call s:HL('LineNr',     'mediumgravel', s:gutter)
call s:HL('SignColumn', '',             s:gutter)
call s:HL('FoldColumn', 'mediumgravel', s:gutter)
call s:HL('Cursor',  'coal', 'tardis', 'bold')
call s:HL('vCursor', 'coal', 'tardis', 'bold')
call s:HL('iCursor', 'coal', 'tardis', 'none')
call s:HL('Special', 'plain')
call s:HL('Comment',        'gravel')
call s:HL('Todo',           'snow', 'bg', 'bold')
call s:HL('SpecialComment', 'snow', 'bg', 'bold')
call s:HL('String', 'dirtyblonde')
call s:HL('Statement',   'taffy', '', 'bold')
call s:HL('Keyword',     'taffy', '', 'bold')
call s:HL('Conditional', 'taffy', '', 'bold')
call s:HL('Operator',    'taffy', '', 'none')
call s:HL('Label',       'taffy', '', 'none')
call s:HL('Repeat',      'taffy', '', 'none')
call s:HL('Identifier', 'orange', '', 'none')
call s:HL('Function',   'orange', '', 'none')
call s:HL('PreProc',   'lime', '', 'none')
call s:HL('Macro',     'lime', '', 'none')
call s:HL('Define',    'lime', '', 'none')
call s:HL('PreCondit', 'lime', '', 'bold')
call s:HL('Constant',  'toffee', '', 'bold')
call s:HL('Character', 'toffee', '', 'bold')
call s:HL('Boolean',   'toffee', '', 'bold')
call s:HL('Number', 'toffee', '', 'bold')
call s:HL('Float',  'toffee', '', 'bold')
call s:HL('SpecialChar', 'dress', '', 'bold')
call s:HL('Type', 'dress', '', 'none')
call s:HL('StorageClass', 'taffy', '', 'none')
call s:HL('Structure', 'taffy', '', 'none')
call s:HL('Typedef', 'taffy', '', 'bold')
call s:HL('Exception', 'lime', '', 'bold')
call s:HL('Error',  'snow',   'taffy', 'bold')
call s:HL('Debug',  'snow',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')
call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'tardis', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')
call s:HL('DiffDelete', 'coal', 'coal')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'snow', 'deepergravel', 'bold')
if has("spell")
    call s:HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call s:HL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call s:HL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call s:HL('SpellRare', '', '', 'undercurl', 'dalespale')
endif
    call s:HL('CtrlPNoEntries', 'snow', 'taffy', 'bold')
    call s:HL('CtrlPMatch', 'orange', 'bg', 'none')
    call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')
    call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')
    call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')
    call s:HL('CtrlPPrtCursor', 'coal', 'tardis', 'bold')
    call s:HL('CtrlPMode1', 'coal', 'tardis', 'bold')
    call s:HL('CtrlPMode2', 'coal', 'tardis', 'bold')
    call s:HL('CtrlPStats', 'coal', 'tardis', 'bold')
call s:HL('EasyMotionTarget', 'tardis',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')
call s:HL('InterestingWord1', 'coal', 'orange')
call s:HL('InterestingWord2', 'coal', 'lime')
call s:HL('InterestingWord3', 'coal', 'saltwatertaffy')
call s:HL('InterestingWord4', 'coal', 'toffee')
call s:HL('InterestingWord5', 'coal', 'dress')
call s:HL('InterestingWord6', 'coal', 'taffy')
call s:HL('level16c', 'mediumgravel',   '', 'bold')
call s:HL('level15c', 'dalespale',      '', '')
call s:HL('level14c', 'dress',          '', '')
call s:HL('level13c', 'orange',         '', '')
call s:HL('level12c', 'tardis',         '', '')
call s:HL('level11c', 'lime',           '', '')
call s:HL('level10c', 'toffee',         '', '')
call s:HL('level9c',  'saltwatertaffy', '', '')
call s:HL('level8c',  'coffee',         '', '')
call s:HL('level7c',  'dalespale',      '', '')
call s:HL('level6c',  'dress',          '', '')
call s:HL('level5c',  'orange',         '', '')
call s:HL('level4c',  'tardis',         '', '')
call s:HL('level3c',  'lime',           '', '')
call s:HL('level2c',  'toffee',         '', '')
call s:HL('level1c',  'saltwatertaffy', '', '')
call s:HL('ShowMarksHLl', 'tardis', 'blackgravel')
call s:HL('ShowMarksHLu', 'tardis', 'blackgravel')
call s:HL('ShowMarksHLo', 'tardis', 'blackgravel')
call s:HL('ShowMarksHLm', 'tardis', 'blackgravel')
call s:HL('clojureSpecial',  'taffy', '', '')
call s:HL('clojureDefn',     'taffy', '', '')
call s:HL('clojureDefMacro', 'taffy', '', '')
call s:HL('clojureDefine',   'taffy', '', '')
call s:HL('clojureMacro',    'taffy', '', '')
call s:HL('clojureCond',     'taffy', '', '')
call s:HL('clojureKeyword', 'orange', '', 'none')
call s:HL('clojureFunc',   'dress', '', 'none')
call s:HL('clojureRepeat', 'dress', '', 'none')
call s:HL('clojureParen0', 'lightgravel', '', 'none')
call s:HL('clojureAnonArg', 'snow', '', 'bold')
call s:HL('lispFunc',           'lime', '', 'none')
call s:HL('lispVar',            'orange', '', 'bold')
call s:HL('lispEscapeSpecial',  'orange', '', 'none')

if g:badcat_css_props_highlight
    call s:HL('cssColorProp', 'taffy', '', 'none')
    call s:HL('cssBoxProp', 'taffy', '', 'none')
    call s:HL('cssTextProp', 'taffy', '', 'none')
    call s:HL('cssRenderProp', 'taffy', '', 'none')
    call s:HL('cssGeneratedContentProp', 'taffy', '', 'none')
else
    call s:HL('cssColorProp', 'fg', '', 'none')
    call s:HL('cssBoxProp', 'fg', '', 'none')
    call s:HL('cssTextProp', 'fg', '', 'none')
    call s:HL('cssRenderProp', 'fg', '', 'none')
    call s:HL('cssGeneratedContentProp', 'fg', '', 'none')
end

call s:HL('cssValueLength', 'toffee', '', 'bold')
call s:HL('cssColor', 'toffee', '', 'bold')
call s:HL('cssBraces', 'lightgravel', '', 'none')
call s:HL('cssIdentifier', 'orange', '', 'bold')
call s:HL('cssClassName', 'orange', '', 'none')
call s:HL('gitDiff', 'lightgravel', '',)
call s:HL('diffRemoved', 'dress', '',)
call s:HL('diffAdded', 'lime', '',)
call s:HL('diffFile', 'coal', 'taffy', 'bold')
call s:HL('diffNewFile', 'coal', 'taffy', 'bold')
call s:HL('diffLine', 'coal', 'orange', 'bold')
call s:HL('diffSubname', 'orange', '', 'none')
call s:HL('djangoArgument', 'dirtyblonde', '',)
call s:HL('djangoTagBlock', 'orange', '')
call s:HL('djangoVarBlock', 'orange', '')
call s:HL('htmlTag',    'darkroast', 'bg', 'none')
call s:HL('htmlEndTag', 'darkroast', 'bg', 'none')
call s:HL('htmlTagName',        'coffee', '', 'bold')
call s:HL('htmlSpecialTagName', 'coffee', '', 'bold')
call s:HL('htmlSpecialChar',    'lime',   '', 'none')
call s:HL('htmlArg', 'coffee', '', 'none')

if g:badcat_html_link_underline
    call s:HL('htmlLink', 'lightgravel', '', 'underline')
else
    call s:HL('htmlLink', 'lightgravel', '', 'none')
endif
call s:HL('javaClassDecl', 'taffy', '', 'bold')
call s:HL('javaScopeDecl', 'taffy', '', 'bold')
call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'snow', '', 'none')
call s:HL('javaDocParam', 'dalespale', '', '')
call s:HL('texStatement', 'tardis', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMathZoneA', 'orange', '', 'none')
call s:HL('texMathZoneB', 'orange', '', 'none')
call s:HL('texMathZoneC', 'orange', '', 'none')
call s:HL('texMathZoneD', 'orange', '', 'none')
call s:HL('texMathZoneE', 'orange', '', 'none')
call s:HL('texMathZoneV', 'orange', '', 'none')
call s:HL('texMathZoneX', 'orange', '', 'none')
call s:HL('texMath', 'orange', '', 'none')
call s:HL('texMathMatcher', 'orange', '', 'none')
call s:HL('texRefLabel', 'dirtyblonde', '', 'none')
call s:HL('texRefZone', 'lime', '', 'none')
call s:HL('texComment', 'darkroast', '', 'none')
call s:HL('texDelimiter', 'orange', '', 'none')
call s:HL('texZone', 'brightgravel', '', 'none')

augroup badcat_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

call s:HL('lessVariable', 'lime', '', 'none')
call s:HL('lispyscriptDefMacro', 'lime', '', '')
call s:HL('lispyscriptRepeat', 'dress', '', 'none')
call s:HL('replPrompt', 'tardis', '', 'bold')
call s:HL('mailSubject', 'orange', '', 'bold')
call s:HL('mailHeader', 'lightgravel', '', '')
call s:HL('mailHeaderKey', 'lightgravel', '', '')
call s:HL('mailHeaderEmail', 'snow', '', '')
call s:HL('mailURL', 'toffee', '', 'underline')
call s:HL('mailSignature', 'gravel', '', 'none')
call s:HL('mailQuoted1', 'gravel', '', 'none')
call s:HL('mailQuoted2', 'dress', '', 'none')
call s:HL('mailQuoted3', 'dirtyblonde', '', 'none')
call s:HL('mailQuoted4', 'orange', '', 'none')
call s:HL('mailQuoted5', 'lime', '', 'none')
call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownItalic', 'snow', '', 'bold')
call s:HL('markdownBold', 'snow', '', 'bold')
call s:HL('markdownH1', 'orange', '', 'bold')
call s:HL('markdownH2', 'lime', '', 'bold')
call s:HL('markdownH3', 'lime', '', 'none')
call s:HL('markdownH4', 'lime', '', 'none')
call s:HL('markdownH5', 'lime', '', 'none')
call s:HL('markdownH6', 'lime', '', 'none')
call s:HL('markdownLinkText', 'toffee', '', 'underline')
call s:HL('markdownIdDeclaration', 'toffee')
call s:HL('markdownAutomaticLink', 'toffee', '', 'bold')
call s:HL('markdownUrl', 'toffee', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call s:HL('markdownCode', 'dirtyblonde', '', 'none')
call s:HL('markdownCodeBlock', 'dirtyblonde', '', 'none')
call s:HL('mysqlSpecial', 'dress', '', 'bold')

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'dress')
call s:HL('pythonBuiltinObj',  'dress')
call s:HL('pythonBuiltinFunc', 'dress')
call s:HL('pythonEscape',      'dress')
call s:HL('pythonException',   'lime', '', 'bold')
call s:HL('pythonExceptions',  'lime', '', 'none')
call s:HL('pythonPrecondit',   'lime', '', 'none')
call s:HL('pythonDecorator',   'taffy', '', 'none')
call s:HL('pythonRun',         'gravel', '', 'bold')
call s:HL('pythonCoding',      'gravel', '', 'bold')
call s:HL('hlLevel0', 'gravel')
call s:HL('hlLevel1', 'orange')
call s:HL('hlLevel2', 'saltwatertaffy')
call s:HL('hlLevel3', 'dress')
call s:HL('hlLevel4', 'coffee')
call s:HL('hlLevel5', 'dirtyblonde')
call s:HL('hlLevel6', 'orange')
call s:HL('hlLevel7', 'saltwatertaffy')
call s:HL('hlLevel8', 'dress')
call s:HL('hlLevel9', 'coffee')
call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')
call s:HL('VimMapMod',    'dress', '', 'none')
call s:HL('VimMapModKey', 'dress', '', 'none')
call s:HL('VimNotation', 'dress', '', 'none')
call s:HL('VimBracket', 'dress', '', 'none')
