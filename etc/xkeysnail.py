import re
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
define_keymap(None, {
    K("Super-c"): K("C-Insert"),
    K("Super-v"): K("Shift-Insert"),
    K("Super-x"): K("C-x"),
    K("Super-a"): K("C-a"),
    K("Super-l"): K("C-l"),
    K("Super-t"): K("C-t"),
    K("Super-w"): K("C-w"),
    K("Super-f"): K("C-f"),
    K("Super-z"): K("C-z"),
    K("Super-r"): K("C-r"),
    K("Super-n"): K("C-n"),
    K("Super-o"): K("C-o"),
    K("Super-RIGHT_BRACE"): K("C-RIGHT_BRACE"),
    K("Super-LEFT_BRACE"): K("C-LEFT_BRACE"),
    K("Super-UP"): K("PAGE_UP"),
    K("Super-DOWN"): K("PAGE_DOWN"),
    K("Super-LEFT"): K("HOME"),
    K("Super-RIGHT"): K("END"),
    K("Super-Shift-LEFT"): K("Shift-HOME"),
    K("Super-Shift-RIGHT"): K("Shift-END"),
})

