
# load composure first, so we support function metadata
source "${REDPILL}/lib/composure.sh"

# support 'plumbing' metadata
cite _about _param _example _group _author _version

#for some reasons the following is extremly slow under cygwin. disabled
if [[ ! "$(bash --version)" == *-cygwin* ]]; then
  # load colors first so they can be use in base theme
  source "${REDPILL}/themes/colors.theme.bash"
  source "${REDPILL}/themes/base.theme.bash"
fi

# library
lib="${REDPILL}/lib/*.bash"
for config_file in $lib; do
  source $config_file
done
unset lib

# load enabled aliases, completion, plugins
for file_type in "aliases" "completion" "plugins"; do
  _load_red_pill_files $file_type
done

# load custom aliases, completion, plugins
for file_type in "aliases" "completion" "plugins"; do
  if [ -e "${REDPILL}/${file_type}/custom.${file_type}.bash" ]; then
    source "${REDPILL}/${file_type}/custom.${file_type}.bash"
  fi
done
unset file_type

# custom
custom="${REDPILL}/custom/*.bash"
for config_file in $custom; do
  if [ -e "${config_file}" ]; then
    source $config_file
  fi
done
unset custom
unset config_file

if [[ $PROMPT ]]; then
  export PS1=$PROMPT
fi

# load all the Jekyll stuff
# TODO: move this to global zsh & bash
if [ -e $HOME/.jekyllconfig ]; then
  . $HOME/.jekyllconfig
fi
