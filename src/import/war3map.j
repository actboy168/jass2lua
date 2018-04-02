function main takes nothing returns nothing
    call Cheat("exec-lua:scripts.runtime")
    call Cheat("exec-lua:scripts.main")
endfunction

function config takes nothing returns nothing
    call Cheat("exec-lua:scripts.runtime")
    call Cheat("exec-lua:scripts.config")
endfunction
