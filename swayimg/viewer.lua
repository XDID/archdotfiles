swayimg.viewer.set_window_background(0xff111111)
swayimg.viewer.set_image_background(0xff111111)
swayimg.viewer.set_default_scale("width")
swayimg.viewer.set_default_position("center")
swayimg.viewer.enable_loop(true)
swayimg.viewer.limit_preload(1)
swayimg.viewer.set_text("topleft", { "{name}  {format}  {sizehr}  {frame.width}x{frame.height}  {meta.*}" })
swayimg.viewer.set_text("topright", { "{list.index}/{list.total}" })
swayimg.viewer.set_text("bottomleft", { "{scale}%  {frame.index}/{frame.total}" })
swayimg.viewer.set_text("bottomright", { "{dir}" }) -- status 属性在当前版本暂无直接对应的模板字段

-- 模式切换与退出
swayimg.viewer.on_key("Return", function()
	swayimg.set_mode("gallery")
end)
swayimg.viewer.on_key("s", function()
	swayimg.set_mode("slideshow")
end)
swayimg.viewer.on_key("q", function()
	swayimg.exit()
end)
swayimg.viewer.on_key("escape", function()
	swayimg.exit()
end)

-- OSD 信息显示切换 (m)
swayimg.viewer.on_key("m", function()
	if swayimg.text.visible() then
		swayimg.text.hide()
	else
		swayimg.text.show()
	end
end)

-- 文件导航
swayimg.viewer.on_key("g", function()
	swayimg.viewer.switch_image("first")
end)
swayimg.viewer.on_key("Shift-g", function()
	swayimg.viewer.switch_image("last")
end)
swayimg.viewer.on_key("p", function()
	swayimg.viewer.switch_image("prev")
end)
swayimg.viewer.on_key("n", function()
	swayimg.viewer.switch_image("next")
end)

-- 目录导航 (修正了原配置中 Shift+p 也是 next_dir 的问题)
swayimg.viewer.on_key("Shift-p", function()
	swayimg.viewer.switch_image("prev_dir")
end)
swayimg.viewer.on_key("Shift-n", function()
	swayimg.viewer.switch_image("next_dir")
end)

-- 动图帧切换
swayimg.viewer.on_key("comma", function()
	swayimg.viewer.prev_frame()
end)
swayimg.viewer.on_key("period", function()
	swayimg.viewer.next_frame()
end)

-- 跳过/移除文件 (c = skip_file)
swayimg.viewer.on_key("c", function()
	local img = swayimg.viewer.get_image()
	if img then
		swayimg.imagelist.remove(img.path)
		swayimg.viewer.switch_image("next")
	end
end)

-- 随机文件及系统通知 (Shift+z)
swayimg.viewer.on_key("Shift-z", function()
	swayimg.viewer.switch_image("random")
	os.execute('notify-send -r 107 -u low "swayimg" "Shuffled"')
end)

-- 抗锯齿开关 (Shift+a)
local aa_enabled = true
swayimg.viewer.on_key("Shift-a", function()
	aa_enabled = not aa_enabled
	swayimg.enable_antialiasing(aa_enabled)
end)

-- 动画播放开关 (Space)
local anim_playing = true
swayimg.viewer.on_key("Space", function()
	if anim_playing then
		swayimg.viewer.animation_stop()
	else
		swayimg.viewer.animation_resume()
	end
	anim_playing = not anim_playing
end)

-- 图像平移 (h, j, k, l / Shift / u, d)
local function move_image(dx, dy)
	local pos = swayimg.viewer.get_position()
	swayimg.viewer.set_abs_position(pos.x + dx, pos.y + dy)
end

swayimg.viewer.on_key("h", function()
	move_image(-10, 0)
end)
swayimg.viewer.on_key("j", function()
	move_image(0, 10)
end)
swayimg.viewer.on_key("k", function()
	move_image(0, -10)
end)
swayimg.viewer.on_key("l", function()
	move_image(10, 0)
end)

swayimg.viewer.on_key("Shift-h", function()
	move_image(-1, 0)
end)
swayimg.viewer.on_key("Shift-j", function()
	move_image(0, 1)
end)
swayimg.viewer.on_key("Shift-k", function()
	move_image(0, -1)
end)
swayimg.viewer.on_key("Shift-l", function()
	move_image(1, 0)
end)

swayimg.viewer.on_key("u", function()
	move_image(0, -100)
end)
swayimg.viewer.on_key("d", function()
	move_image(0, 100)
end)

-- 图像缩放 (i, o / z, w, a, f)
local function zoom_image(delta)
	local scale = swayimg.viewer.get_scale()
	swayimg.viewer.set_abs_scale(scale + delta)
end

swayimg.viewer.on_key("i", function()
	zoom_image(0.1)
end) -- +10%
swayimg.viewer.on_key("o", function()
	zoom_image(-0.1)
end) -- -10%

swayimg.viewer.on_key("z", function()
	swayimg.viewer.set_fix_scale("real")
end)
swayimg.viewer.on_key("w", function()
	swayimg.viewer.set_fix_scale("width")
end)
swayimg.viewer.on_key("a", function()
	swayimg.viewer.set_fix_scale("fit")
end)
swayimg.viewer.on_key("f", function()
	swayimg.viewer.set_fix_scale("fill")
end)

-- 图像旋转 (r, Shift+r)
-- 注意：Lua API 目前仅支持设置绝对角度 (90, 180, 270)，因此通过状态变量计算相对旋转
local rot_angle = 0
swayimg.viewer.on_key("r", function()
	rot_angle = (rot_angle + 90) % 360
	if rot_angle == 0 then
		swayimg.viewer.reset()
	else
		swayimg.viewer.rotate(rot_angle)
	end
end)
swayimg.viewer.on_key("Shift-r", function()
	rot_angle = (rot_angle - 90) % 360
	if rot_angle < 0 then
		rot_angle = rot_angle + 360
	end
	if rot_angle == 0 then
		swayimg.viewer.reset()
	else
		swayimg.viewer.rotate(rot_angle)
	end
end)

-- 图像翻转 (v, Shift+v)
swayimg.viewer.on_key("v", function()
	swayimg.viewer.flip_vertical()
end)
swayimg.viewer.on_key("Shift-v", function()
	swayimg.viewer.flip_horizontal()
end)

-- 外部脚本执行 (替换 `%` 为当前图片绝对路径)
local function exec_with_path(cmd_template)
	local img = swayimg.viewer.get_image()
	if img and img.path then
		-- 将模板中的 % 替换为被引号包裹的文件路径，防止空格导致命令断裂
		local cmd = cmd_template:gsub("%%", '"' .. img.path .. '"')
		os.execute(cmd)
	end
end

swayimg.viewer.on_key("Shift-d", function()
	exec_with_path("/home/harunato/.local/bin/swayimg-rm %")
end)

swayimg.viewer.on_key("Ctrl-r", function()
	exec_with_path("/home/harunato/.local/bin/swayimg-rotate %")
end)

swayimg.viewer.on_key("Shift-i", function()
	exec_with_path("magick % -channel RGB -negate - | swayimg -")
end)

swayimg.viewer.on_key("Shift-w", function()
	exec_with_path("qs -c noctalia-shell ipc call wallpaper set % all")
	swayimg.exit()
end)

-- 注意：Lua API 当前版本没有直接的 "reload" 函数（对应原 Shift+r）
