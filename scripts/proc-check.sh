#!/bin/sh
set -u
pat='l(rc|jd|cw)1[.]'
total=0; readable=0; hits=''
for p in /proc/[0-9]*; do
  [ -d "$p" ] || continue
  n=${p#/proc/}
  [ "$n" = "$$" ] && continue
  total=$((total + 1))
  if env=$(tr '\0' '\n' 2>/dev/null < "$p/environ"); then
    readable=$((readable + 1))
    if printf '%s\n' "$env" | grep -Eq "$pat"; then hits="$hits $n/environ"; fi
  fi
  if cmd=$(tr '\0' ' ' 2>/dev/null < "$p/cmdline"); then
    if printf '%s\n' "$cmd" | grep -Eq "$pat"; then hits="$hits $n/cmdline"; fi
  fi
done
if tr '\0' '\n' 2>/dev/null < /proc/1/environ > /dev/null; then pid1=readable; else pid1=unreadable; fi
summary="proc-check: $total processes, $readable environs readable, pid 1 environ $pid1"
if [ "$readable" -eq 0 ]; then
  echo "$summary; no environment was readable, so the check proves nothing"
  exit 1
fi
if [ -n "$hits" ]; then
  echo "$summary; WORKER SECRET VISIBLE in:$hits"
  exit 1
fi
echo "$summary; no worker secret visible"
if [ -d .git ]; then echo "$summary; no worker secret visible" > .git/libra-proc-check.txt; fi
