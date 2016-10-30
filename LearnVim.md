## suspend vim
    
`ctrl+z`: suspend vim and get back to your shell
`fg`: resume(bring to foreground) your suspend vim
`:sh`: start a subshell (as configured by `:set shell?`)
`ctrl+d` or `exit`): kill the shell and return to vim

## 'yank & put' in vim

In Vim, the primary commands for yanking (copying) and putting (pasting) are y and p.

Yanking places the yanked text in a register. That register is the unnamed register, ", by default but one can use other registers:

    "ay    " yank into register a
    "+y    " yank into clipboard register
    "/y    " yank into the search register
    […]
Similarly, putting inserts text from a register. That register is the unnamed register by default but one can use other registers:

    "ap    " put from register a
    "+p    " put from clipboard register
    "3p    " put from the register 3
    […]
Those commands are prefered to "Right-click/Paste or Middle Click or CTRL+SHFT+V" because the text is "put" into the buffer without any special treatment. With "Right-click/Paste or Middle Click or CTRL+SHFT+V", the text is inserted in the buffer as if you typed it and is thus subjected to automatic indenting/formatting.

If you can't use "+p or "*p — working over SSH without X forwarding or Vim built without clipboard support — the paste option disables automatic indenting and a bunch of other very useful options so that your typed text is not alrered.

As noted in :help 'paste, the options has potentially very bad side effects so it is important to disable it right after you pasted your text:

    :set paste
    (paste)
    :set nopaste
That dance is obviously a pain in the ass so there is another option that lets you define a special shortcut for toggling paste:

    set pastetoggle=<F12>
That slightly reduces the pain:

    <F12>
    (paste)
    <F12>
But it is still a pain.

If you can, it is recommended to install a proper Vim with clipboard support so you can use "*p or "+p (depending on how you copied your text) to paste text the right way.

On Mac OS X: install MacVim,
on Debian-based systems: install the vim-gnome or vim-gtk package,
on CentOS: install the vim-enhanced package.

Reference:

    :help p
    :help y
    :help registers
    :help 'paste'
    :help 'pastetoggle'
