#!/bin/bash

# ==============================================================================
# 1. 配置区
# ==============================================================================
CLEAR_WALL_FILE="/home/harunato/Pictures/Wallpapers/Temp/clear_wallpaper.txt"
BLUR_WALL="/home/harunato/Pictures/Wallpapers/Temp/overview.png"

# ==============================================================================
# 2. 后端检测
# ==============================================================================

SET_WALL_CMD="qs -c noctalia-shell ipc call wallpaper set"

log() { echo -e "[$(date '+%H:%M:%S')] $1"; }

# ==============================================================================
# 3. 清理与退出
# ==============================================================================
cleanup() {
  if [[ -f "$CLEAR_WALL_FILE" ]]; then
    clear_wall=$(<"$CLEAR_WALL_FILE")
    [[ -f "$clear_wall" ]] && qs -c noctalia-shell ipc call wallpaper set "$clear_wall" all
  fi
  exit 0
}
trap cleanup EXIT SIGINT SIGTERM

# ==============================================================================
# 4. 主循环
# ==============================================================================
log "Daemon Started (PID: $$)"
CUR_WALL=""
niri msg event-stream | grep --line-buffered -E "Window focus changed|Window opened or changed" | while read -r line; do
  case "$line" in
  *"Window focus changed: Some"* | *"Window opened or changed: Window"*)
    # 有窗口聚焦 -> 切换到模糊
    if [[ $CUR_WALL = $BLUR_WALL ]]; then
      continue
    fi
    if [[ -f "$BLUR_WALL" ]]; then
      $SET_WALL_CMD "$BLUR_WALL" "all" &
      log "Window focused -> Blur" &
      CUR_WALL=$BLUR_WALL
    fi
    ;;
  *"Window focus changed: None"*)
    # 无窗口聚焦 -> 恢复清晰背景
    if [[ $CUR_WALL = $(<"$CLEAR_WALL_FILE") ]]; then
      continue
    fi
    if [[ -f "$CLEAR_WALL_FILE" ]]; then
      clear_wall=$(<"$CLEAR_WALL_FILE")
      [[ -f "$clear_wall" ]] && $SET_WALL_CMD "$clear_wall" "all" &
      log "Window unfocused -> Clear" &
      CUR_WALL=$(<"$CLEAR_WALL_FILE")
    fi
    ;;
  esac
done
