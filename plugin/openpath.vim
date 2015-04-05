" ProcenterのIDから自動でProcenterを起動する
" ファイルパスから自動でVimfilerを起動する
 
if exists("g:loaded_openpath")
  finish
endif
let g:loaded_openpath = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:OpenPath_Host')
  echo "You must set g:OpenPath_Host for using openpath.vim"
  finish
endif

if !exists('g:OpenPath_User')
  echo "You must set g:OpenPath_User for using openpath.vim"
  finish
endif

if !exists('g:OpenPath_Password')
  echo "You must set g:OpenPath_Password for using openpath.vim"
  finish
endif

if !exists('g:OpenPath_ProcenterPath')
    let g:OpenPath_ProcenterPath = "C:\\Program Files\ (x86)\\ProcenterLite\\PROCENTER3.6.5.0lite\\PrCenterLite.exe"
endif

function! HandlePath()

  let s:path = matchstr(getline("."), '[CD]\{1\}:\/.*')
" echo s:path

  if s:path != ""
    exec ":VimFilerTab " . s:path
    return 0
  else
    echo "No Path found in line."
  endif


  let s:ProcenterId = matchstr(getline("."), '[0-9]\{8,\}')

" echo s:ProcenterId
  if s:ProcenterId != ""
    exec ":!start \"".g:OpenPath_ProcenterPath."\" -host ".g:OpenPath_Host." -user ".g:OpenPath_User." -passwd ".g:OpenPath_Password." -path ".g:OpenPath_Host."/".s:ProcenterId
  else
    echo "No Procenter ID in line."
  endif

endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
