if exists("b:current_syntax")
  finish
endif

syn keyword concat AND
syn keyword indicators SMA MACD Line Signal Hist RSI
syn keyword intervals Daily
syn keyword setup type exchange

syn match braces '[\[\]]'
syn match comment '^//.*$'
syn match comment '^#.*$'
syn match operators '[+<>=]'
syn match time '\d\+\sdays\sago'
syn match time '(Yester|To)day\'s'

syn region condition start="\[" end="\]" fold transparent 
syn region params start="(" end=")" 

let b:current_syntax = "stockcharts"

hi def link comment Comment
hi def link indicators Function
hi def link intervals Constant
hi def link operators Conditional
hi def link params Special
hi def link setup Identifier
hi def link time Label
