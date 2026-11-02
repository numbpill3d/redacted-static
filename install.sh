#!/usr/bin/env bash
# Redacted — Static (KWin script) — install.  ./install.sh
set -euo pipefail
HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
DST=${XDG_DATA_HOME:-$HOME/.local/share}/kwin/scripts/redacted_static
rm -rf "$DST"; mkdir -p "$DST"
cp -r "$HERE"/{metadata.json,contents} "$DST"/
kwriteconfig6 --file kwinrc --group Plugins --key redacted_staticEnabled true
qdbus6 org.kde.KWin /Scripting org.kde.kwin.Scripting.unloadScript redacted_static >/dev/null 2>&1 || true
qdbus6 org.kde.KWin /Scripting org.kde.kwin.Scripting.start >/dev/null 2>&1 || true
