#!/bin/sh

render() {
  sed 's/\(\!\[..*\](\)\(..*\)\()\)/\1\2?'"${time}"'\3/' "${watch_md}" > "${tmp_md}"
}

watch_md="$1"
basename="$(basename "${watch_md}")"
dirname="$(dirname "${watch_md}")"

tmp_md="${dirname}/tmp.${basename}"

echo "${watch_md} の監視を開始します..." >&2

time="$(date "+%Y%m%d%H%M%S")"
render

shiba "${tmp_md}"

while :; do
  path="$(fswatch -l 0.1 -1 --event Updated "${dirname}")"
  if [ "${path}" ]; then
    time="$(date "+%Y%m%d%H%M%S")"
    echo "${time} ${path} が変更されました" >&2
    render
  else
    echo "終了します" >&2
    exit 1
  fi
done 
