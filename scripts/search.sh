#!/usr/bin/env bash
# 用法: ./search.sh <关键词> [license] [source]
# 示例: ./search.sh whoosh cc0
#       ./search.sh rain all-cc
set -euo pipefail

Q="${1:?用法: $0 <关键词> [license] [source]}"
LICENSE="${2:-cc0}"
SOURCE="${3:-freesound}"

URL="https://api.openverse.org/v1/audio/?q=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$Q")&source=${SOURCE}&license=${LICENSE}&page_size=10"

curl -s "$URL" | python3 -c "
import json, sys
d = json.load(sys.stdin)
rs = d.get('results', [])
print(f\"共 {d.get('result_count', len(rs))} 条，显示前 {len(rs)} 条\n\")
for r in rs:
    dur = (r.get('duration') or 0) / 1000
    print(f\"{r.get('title')}  |  {r.get('creator')}  |  {dur:.1f}s  |  {r.get('license')}\")
    print(f\"  {r.get('url')}\")
    if r.get('license') not in ('cc0', 'pdm'):
        print(f\"  署名: {r.get('attribution')}\")
    print()
"
