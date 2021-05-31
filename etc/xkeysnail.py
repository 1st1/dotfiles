import re
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
define_keymap(None, {
    K("Super-c"): K("C-Insert"),
    K("Super-v"): K("Shift-Insert"),
    **{
        K(f"Super-{ch}"): K(f"C-{ch}")
        for ch in {'a', 'b', 'd', 'e', 'f', 'g', 'h',
                   'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
                   'q', 'r', 's', 't', 'u', 'w', 'x',
                   'y', 'z'}
    },
    K("Super-COMMA"): K("C-COMMA"),
    K("Super-ENTER"): K("C-ENTER"),
    K("Super-RIGHT_BRACE"): K("C-RIGHT_BRACE"),
    K("Super-LEFT_BRACE"): K("C-LEFT_BRACE"),
    K("Super-UP"): K("PAGE_UP"),
    K("Super-DOWN"): K("PAGE_DOWN"),
    K("Super-LEFT"): K("HOME"),
    K("Super-RIGHT"): K("END"),
    K("Super-Shift-LEFT"): K("Shift-HOME"),
    K("Super-Shift-RIGHT"): K("Shift-END"),
    K("Super-Shift-P"): K("C-Shift-P"),
})

