#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 ]]; then
  echo "usage: $0 YEAR EVENT CATEGORY TITLE" >&2
  exit 2
fi

year="$1"
event="$2"
category="$3"
shift 3
title="$*"

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

slugify() {
  # Lowercase, replace non-alnum with '-', collapse repeats, trim '-'
  echo "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-+/-/g'
}

slug="$(slugify "$title")"
if [[ -z "$slug" ]]; then
  echo "error: title slugified to empty string" >&2
  exit 1
fi

base="${repo_root}/${year}/${event}/${category}"
mkdir -p "${base}"

out="${base}/${slug}.md"
if [[ -e "$out" ]]; then
  echo "exists: $out" >&2
  exit 1
fi

escape_sed_repl() {
  # Escape characters that are special in sed replacement strings.
  printf '%s' "$1" | sed -e 's/[\\/&|]/\\&/g'
}

esc_title="$(escape_sed_repl "$title")"
esc_event="$(escape_sed_repl "$event")"
esc_year="$(escape_sed_repl "$year")"
esc_category="$(escape_sed_repl "$category")"

sed \
  -e "s|{TITLE}|${esc_title}|g" \
  -e "s|{EVENT}|${esc_event}|g" \
  -e "s|{YEAR}|${esc_year}|g" \
  -e "s|{CATEGORY}|${esc_category}|g" \
  -e "s|{POINTS}|TBD|g" \
  -e "s|{SOLVES}|TBD|g" \
  -e "s|{FLAG}|REDACTED|g" \
  "${repo_root}/templates/writeup.md" > "$out"

# Ensure category index exists and has a link to the new file.
index="${base}/README.md"
if [[ ! -e "$index" ]]; then
  {
    echo "# ${event} ${year}: ${category}"
    echo
  } > "$index"
fi

rel="${slug}.md"
line="- [${title}](${rel})"

if command -v rg >/dev/null 2>&1; then
  # Avoid duplicates if the link format changes (file vs folder).
  if ! rg -Fq -- "(${slug}" "$index"; then
    echo "$line" >> "$index"
  fi
else
  if ! grep -Fq -- "(${slug}" "$index"; then
    echo "$line" >> "$index"
  fi
fi

echo "created: $out"
