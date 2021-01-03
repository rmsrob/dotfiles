# Moves an existing thing to the same path and name but with
# ".preserved.<tstamp>" at the end and echoes the new location. Usually
# preferable to destroying what was previously there. Can be used to roll
# back changes transactionally.

preserve () {
  declare target="${1%/}"
  [[ ! -e "$target" ]] && return 1
  declare new="$target.preserved.$(tstamp)"
  mv "$target" "$new" 
  echo "$new" 
}

# Lists all the preserved files by matching the .preserved<tstamp> suffix.
# If passed an argument limits to only those preserved files matching that
# name (prefix).

lspreserved () {
  declare -a files
  if [[ -z "$1" ]]; then
      files=(*.preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  else
      files=("$1".preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  fi
  for i in "${files[@]}"; do
    echo "$i"
  done
}

lastpreserved () {
  mapfile -t  a < <(lspreserved "$1")
  declare n=${#a[@]}
  echo "${a[n-1]}"
}

rmpreserved () {
  while IFS= read -r line; do
    rm -rf "$line"
  done < <(lspreserved)
}

# Undos the last preserve performed on the given target.

unpreserve () {
  declare last=$(lastpreserved "$*")
  [[ -z "$last" ]] && return 1
  mv "$last" "${last%.preserved*}"
}

