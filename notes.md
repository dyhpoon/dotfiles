Telescope:
========
- find_file
- find_file cwd=~/.config
    - no current dir
    - can just nvim config
    - ctrl v/x split
- git_commits
- git_bcommits
- commands
- git_files
- live_grep
    - search function name, slow
- grep_string search=Home
    - fuzzy search after search
- file_browser
    - files under current dir
    - ctrl e create file
- coc
- currnet_buffer_fuzzy

- gd
    - ctrl t: goback

keymap
leader g - git
leader f - file
leader c - commit

quickfix list
    - ctrl q
    - :cnext

:so %
:luafile %

:s/set/state/g

file browser:
========
:Ex
Ctrl+w v, :Ex

windows:
========
Ctrl+w v, s (vertical split, horizaontal split)
Ctrl+w o (close all except current)
Ctrl+w = (resize equal)
:vertical resize 20
z -> enter Poition the screen

help:
========
Ctrl+] go to
Ctrl+w Ctrl+w change panel
Ctrl+d list all the commands

insert:
========
80 -> i -> * -> esc
g -> ~ -> w, change word to upper/lower
gUU -> entire line uppercase
guu -> entire line lowercase
J -> append 2 lines + space
gJ -> no space, append 2 lines

search:
========
f{char} -> case sensitive search
F{char} -> search backward
/{word}
?{word} -> go backward
