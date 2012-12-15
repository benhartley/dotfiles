" Vim syntax file
" Language:         To-do list
" Maintainer:       Eric Talevich
" Latest Revision:  2009-01-27

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" GUI options
set wrap formatoptions+=t textwidth=80

" The keywords listed here will be highlighted -- add your own
syn keyword todoTodo        contained TODO FIXME XXX NOTE ENH NB WTF ???
" TODO: make this a user-defined global: g:TodoKeywords='foo,bar,baz'
syn keyword todoImportant   San Diego Francisco Los Angeles
syn keyword todoImportant   contained San Diego Francisco Los Angeles
syn keyword todoAlias       Padres Chargers Burritos
syn keyword todoAlias       contained Padres Chargers Burritos


"syn match   todoNodeProperty    '!\%(![^\\^%     ]\+\|[^!][^:/   ]*\)'
" syn match   todoAnchor          '&.\+'
" syn match   todoAlias           '\*.\+'
" Makes it dark yellow/gold, e.g. keyword or match here


" Removed todoComment block
" Erase any other errata found
"syn match   todoDelimiter       '[-,:]'
"syn match   todoBlock           '[\[\]{}>|]'
"syn match   todoOperator        '[?+-]'
"syn match   todoKey             '\w\+\(\s\+\w\+\)*\ze\s*:'
" Lines ending in ':'
syn match   todoKey             '^.*:\s*$'
                                \ contains=todoTodo,todoAlias,todoNumber,@Spell

syn match   todoEscape          contained display +\\[\\"abefnrtv^0_ NLP]+
syn match   todoEscape          contained display '\\x\x\{2}'
syn match   todoEscape          contained display '\\u\x\{4}'
syn match   todoEscape          contained display '\\U\x\{8}'
syn match   todoEscape          display '\\\%(\r\n\|[\r\n]\)'
syn match   todoSingleEscape    contained display +''+

syn match   todoNumber          display '\<[+-]\=\d\+\%(\.\d\+\%([eE][+-]\=\d\+\)\=\)\='
syn match   todoNumber          display '0\o\+'
syn match   todoNumber          display '0x\x\+'
syn match   todoNumber          display '([+-]\=[iI]nf)'
syn match   todoNumber          display '(NaN)'

syn match   todoConstant        '\<[~yn]\>'
syn keyword todoConstant        true True TRUE false False FALSE
syn keyword todoConstant        yes Yes no No
syn keyword todoConstant        null Null NULL nil Nil NIL

syn match   todoTimestamp       '\d\d\d\d-\%(1[0-2]\|\d\)-\%(3[0-2]\|2\d\|1\d\|\d\)\%( \%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\d\d [+-]\%([01]\d\|2[0-3]\):[0-5]\d\|t\%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\d\d[+-]\%([01]\d\|2[0-3]\):[0-5]\d\|T\%([01]\d\|2[0-3]\):[0-5]\d:[0-5]\d.\dZ\)\='

" Lines starting with '*'
syn match   todoComment         '^\s*[*].*$'
                                \ contains=todoTodo,todoAlias,todoNumber,@Spell

" From '{' to the end of the line
syn match   todoSectionHeader   '{.*$'
syn match   todoDirective       contained '%[^:]\+:.\+'

hi def link todoTodo            Todo
hi def link todoComment         Comment
hi def link todoSectionHeader   PreProc
hi def link todoDirective       Keyword
hi def link todoNodeProperty    Type
hi def link todoAnchor          Type
hi def link todoAlias           Type
hi def link todoDelimiter       Delimiter
hi def link todoBlock           Operator
hi def link todoOperator        Operator
hi def link todoKey             Identifier
hi def link todoString          String
hi def link todoEscape          SpecialChar
hi def link todoSingleEscape    SpecialChar
hi def link todoNumber          Number
hi def link todoConstant        Constant
hi def link todoImportant       Operator
hi def link todoTimestamp       Number

let b:current_syntax = "todolist"

let &cpo = s:cpo_save
unlet s:cpo_save
