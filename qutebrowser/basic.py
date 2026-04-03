c.colors.webpage.preferred_color_scheme = "auto"
c.colors.webpage.darkmode.policy.images = "smart-simple"
c.colors.webpage.darkmode.policy.page = "smart"

c.downloads.location.directory = "/home/harunato/Downloads/"
c.downloads.position = "bottom"
c.downloads.remove_finished = 3
c.downloads.location.prompt = False

c.editor.command = ["footclient", "nvim", "-f", "{file}"]
c.editor.remove_file = True

c.fileselect.handler = "external"
c.fileselect.folder.command = ["footclient", "yazi", "--cwd-file", "{}"]
c.fileselect.multiple_files.command = [
    "footclient", "yazi", "--chooser-file", "{}"
]
c.fileselect.single_file.command = [
    "footclient", "yazi", "--chooser-file", "{}"
]

c.scrolling.smooth = False
c.statusbar.show = "in-mode"

c.tabs.title.format = "{audio}{relative_index}:{current_title}"
c.tabs.close_mouse_button = "none"
c.tabs.position = "left"
c.tabs.show = "never"
c.tabs.width = "20%"
c.window.title_format = "{private}{perc}{current_title}{title_sep}"

c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "Google": "https://www.google.com/search?q={}",
    "Bing": "https://cn.bing.com/search?q={}",
    "Github": "https://github.com/search?q={}",
    "Bilibili": "https://search.bilibili.com/all?keyword={}",
    "Pornhub": "https://cn.pornhub.com/video/search?search={}",
    "DuckDuckGo": "https://duckduckgo.com/?q={}",
    "Wallhaven": "https://wallhaven.cc/search?q={}",
    "ArchCN": "https://wiki.archlinuxcn.org/wzh/index.php?search={}",
    "Arch": "https://wiki.archlinux.org/index.php?search={}",
    "Codeberg": "https://codeberg.org/explore/repos?q={}"
}
