require("viewer")
require("gallery")
require("slideshow")

-- [general]
swayimg.set_mode("viewer")
swayimg.set_window_size(640, 360)

-- [list]
swayimg.imagelist.set_order("alpha")
swayimg.imagelist.enable_recursive(true)
swayimg.imagelist.enable_adjacent(true) -- 对应原配置的 all = yes

-- [font]
swayimg.text.set_font("SourceCodePro")
swayimg.text.set_size(14)
swayimg.text.set_foreground(0xffffffff) -- 对应 #FFFFFF
swayimg.text.set_shadow(0xff000000) -- 对应 #000000

-- [info]
swayimg.text.set_timeout(0)
swayimg.text.set_status_timeout(0)
swayimg.enable_antialiasing(true)
swayimg.text.hide() -- 对应 show = no
