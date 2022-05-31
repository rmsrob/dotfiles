" This is the my languagetool

function! Lt_fr()
  let g:languagetool_lang='fr'
  LanguageToolCheck
endfunction

function! Lt_en()
  let g:languagetool_lang='en-US'
  LanguageToolCheck
endfunction

noremap 	<leader><F8> :call Lt_fr()<CR>
noremap 	<F8> :call Lt_en()<CR>

let g:languagetool_jar='/$HOME/.local/bin/languagetool/LanguageTool-5.1-SNAPSHOT/languagetool-commandline.jar'
" let g:languagetool_lang='fr'

"Enable all categories
let g:languagetool_enable_categories = 'PUNCTUATION,TYPOGRAPHY,CASING,COLLOCATIONS,CONFUSED_WORDS,CREATIVE_WRITING,GRAMMAR,MISC,MISUSED_TERMS_EU_PUBLICATIONS,NONSTANDARD_PHRASES,PLAIN_ENGLISH,TYPOS,REDUNDANCY,SEMANTICS,TEXT_ANALYSIS,STYLE,GENDER_NEUTRALITY'

"Enable all special rules that cannot be enabled via category
let g:languagetool_enable_rules = 'AND_ALSO,ARE_ABLE_TO,ARTICLE_MISSING,AS_FAR_AS_X_IS_CONCERNED,BEST_EVER,BLEND_TOGETHER,BRIEF_MOMENT,CAN_NOT,CANT_HELP_BUT,COMMA_WHICH,EG_NO_COMMA,ELLIPSIS,EXACT_SAME,HONEST_TRUTH,HOPEFULLY,IE_NO_COMMA,IN_ORDER_TO,I_VE_A,NEGATE_MEANING,PASSIVE_VOICE,PLAN_ENGLISH,REASON_WHY,SENT_START_NUM,SERIAL_COMMA_OFF,SERIAL_COMMA_ON,SMARTPHONE,THREE_NN,TIRED_INTENSIFIERS,ULESLESS_THAT,WIKIPEDIA,WORLD_AROUND_IT'


hi LanguageToolGrammarError cterm=Underline ctermfg=NONE ctermbg=NONE term=underline gui=undercurl guisp=#00ff00 guibg=NONE guifg=#00FF00
hi LanguageToolSpellingError cterm=Underline ctermfg=NONE ctermbg=NONE term=underline gui=undercurl guisp=#FF0000 guibg=NONE guifg=#FF0000


" disable by default but active on .md file (see functions.vim)
set nospell

