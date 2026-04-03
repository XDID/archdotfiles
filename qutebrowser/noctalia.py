surface = "#151217"
surface_dim = "#151217"
surface_bright = "#3b383d"
surface_container = "#211f23"
surface_container_low = "#1d1b1f"
surface_container_lowest = "#0f0d12"
surface_container_high = "#2c292e"
surface_container_highest = "#373439"
surface_variant = "#4a454f"

# Foreground Colors
on_surface = "#e7e0e7"
on_surface_variant = "#ccc4d0"

# Primary Colors
primary = "#d7baff"
on_primary = "#3c2261"
primary_container = "#533a7a"
on_primary_container = "#eddcff"

# Secondary Colors
secondary = "#d0c0e1"
on_secondary = "#362c45"
secondary_container = "#4d425c"
on_secondary_container = "#ecdcfe"

# Tertiary Colors
tertiary = "#ffafd1"
on_tertiary = "#56193a"
tertiary_container = "#713051"
on_tertiary_container = "#ffd8e6"

# Error Colors
error = "#ffb4ab"
on_error = "#690005"
error_container = "#93000a"
on_error_container = "#ffdad6"

# Outline Colors
outline = "#958e9a"
outline_variant = "#4a454f"

# Special Colors
inverse_surface = "#e7e0e7"
inverse_on_surface = "#322f34"
inverse_primary = "#6c5293"


# Completion

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = [on_surface, primary, tertiary]

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = surface_container

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = surface_container_low

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = primary

# Background color of the completion widget category headers.
c.colors.completion.category.bg = surface_container_high

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = outline_variant

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = outline_variant

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = on_primary_container

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = primary_container

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = primary_container

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = primary_container

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = tertiary

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = tertiary

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = primary

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = surface_variant

# Context menu

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = surface_variant

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = on_surface_variant

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = surface_container

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg = on_surface

# Background color of the context menu's selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = secondary_container

# Foreground color of the context menu's selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = on_secondary_container

# Downloads

# Background color for the download bar.
c.colors.downloads.bar.bg = surface

# Color gradient start for download text.
c.colors.downloads.start.fg = on_primary

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = primary

# Color gradient end for download text.
c.colors.downloads.stop.fg = on_secondary

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = secondary

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = error

# Hints

# Font color for hints.
c.colors.hints.fg = on_surface

# Background color for hints.
c.colors.hints.bg = inverse_on_surface

# Font color for the matched part of hints.
c.colors.hints.match.fg = on_surface

# Keyhint widget

# Text color for the keyhint widget.
c.colors.keyhint.fg = on_surface_variant

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = primary

# Background color of the keyhint widget.
c.colors.keyhint.bg = surface_container

# Messages

# Foreground color of an error message.
c.colors.messages.error.fg = on_error

# Background color of an error message.
c.colors.messages.error.bg = error

# Border color of an error message.
c.colors.messages.error.border = error

# Foreground color of a warning message.
c.colors.messages.warning.fg = on_error_container

# Background color of a warning message.
c.colors.messages.warning.bg = error_container

# Border color of a warning message.
c.colors.messages.warning.border = error_container

# Foreground color of an info message.
c.colors.messages.info.fg = on_surface

# Background color of an info message.
c.colors.messages.info.bg = surface_container

# Border color of an info message.
c.colors.messages.info.border = outline

# Prompts

# Foreground color for prompts.
c.colors.prompts.fg = on_surface

# Border used around UI elements in prompts.
c.colors.prompts.border = f'1px solid {outline}'

# Background color for prompts.
c.colors.prompts.bg = surface_container_high

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = secondary_container

# Statusbar

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = on_surface

# Background color of the statusbar.
c.colors.statusbar.normal.bg = surface

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = on_primary

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = primary

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = on_secondary

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = secondary

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = tertiary

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = surface

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = on_surface

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = surface_container

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = tertiary

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = surface_container

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = on_tertiary

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = tertiary

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = on_tertiary_container

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = tertiary_container

# Background color of the progress bar.
c.colors.statusbar.progress.bg = primary

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = on_surface_variant

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = error

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = primary

# Foreground color of the URL in the statusbar on successful load (http).
c.colors.statusbar.url.success.http.fg = error

# Foreground color of the URL in the statusbar on successful load (https).
c.colors.statusbar.url.success.https.fg = secondary

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = tertiary

# Tabs

# Background color of the tab bar.
c.colors.tabs.bar.bg = surface

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = primary

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = secondary

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = error

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = on_surface_variant

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = surface_container

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = on_surface_variant

# Background color of unselected even tabs.
c.colors.tabs.even.bg = surface_container_high

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = on_primary_container

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = primary_container

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = on_primary_container

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = primary_container

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = secondary_container

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = on_secondary_container

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = secondary_container

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = on_secondary_container

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = primary_container

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = on_primary_container

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = primary_container

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = on_primary_container

# Background color for webpages if unset (or empty to use the theme's color).
c.colors.webpage.bg = surface
