import re
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
define_keymap(None, {
    K("Super-c"): K("C-Insert"),
    K("Super-v"): K("Shift-Insert"),
    K("Super-EQUAL"): K("C-EQUAL"),
    K("Super-MINUS"): K("C-MINUS"),
    **{
        # No "d" -- we want both ctrl+d and super+d work in terminal
        # No "c" and "v" -- they are handled specially
        K(f"Super-{ch}"): K(f"C-{ch}")
        for ch in {'a', 'b', 'e', 'f', 'g', 'h',
                   'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
                   'q', 'r', 's', 't', 'u', 'w', 'x',
                   'y', 'z'}
    },
    K("Super-COMMA"): K("C-COMMA"),
    K("Super-DOT"): K("C-DOT"),
    K("Super-ENTER"): K("C-ENTER"),
    K("Super-RIGHT_BRACE"): K("C-RIGHT_BRACE"),
    K("Super-LEFT_BRACE"): K("C-LEFT_BRACE"),
    K("Super-UP"): K("C-HOME"),
    K("Super-DOWN"): K("C-END"),
    K("Super-Shift-DOWN"): K("C-Shift-END"),
    K("Super-Shift-UP"): K("C-Shift-HOME"),
    K("Super-LEFT"): K("HOME"),
    K("Super-RIGHT"): K("END"),
    K("Super-Shift-LEFT"): K("Shift-HOME"),
    K("Super-Shift-RIGHT"): K("Shift-END"),
    K("Super-Shift-P"): K("C-Shift-P"),
    K("Super-Shift-T"): K("C-Shift-T"),
    K("Super-Shift-C"): K("C-Shift-C"),
    K("Super-Shift-Z"): K("C-y"),
    K("Super-M-i"): K("C-Shift-I"),
})

