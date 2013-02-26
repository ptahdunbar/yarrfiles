#!/bin/sh

# disable non-existing file matching
shopt -s dotglob
shopt -s nullglob

# Set the operating system global
[ 'Darwin' == `uname` ] && YARRF_OS='osx' || [ 'Linux' == `uname` ] && YARRF_OS='linux' || YARRF_OS='yarr'
export YARRF_OS=$YARRF_OS;

# Get the current shell
CSHELL=`basename $SHELL`
export YARRF_SH=$CSHELL

# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z $YARRF_CUSTOM ]]; then
    YARRF_CUSTOM="$YARRF/custom"
fi

is_plugin() {
	local base_dir=$1
	local name=$2

	test -f $base_dir/plugins/$name/$name.plugin.$CSHELL \
		|| test -f $base_dir/plugins/$name/$name.plugin.sh \
		|| test -f $base_dir/plugins/$name/_$name
}

# autocompletion for zsh
if [[ $CSHELL == 'zsh' ]]; then
	for plugin in "${plugins[@]}"; do
		if is_plugin $YARRF_CUSTOM $plugin; then
			fpath=($YARRF_CUSTOM/plugins/$plugin $fpath)
		elif is_plugin $YARRF $plugin; then
			fpath=($YARRF/plugins/$plugin $fpath)
		fi
	done

	autoload -U compinit
	compinit -i
fi

# load all custom scripts
for script in ${YARRF_CUSTOM}/*.{sh,${CSHELL}}; do
	echo "source $script"
	source $script
done


# Load all enabled plugins
for plugin in "${plugins[@]}"; do
	if [ -f "$YARRF_CUSTOM/plugins/$plugin/$plugin.plugin.$CSHELL" ]; then
		source "$YARRF_CUSTOM/plugins/$plugin/$plugin.plugin.$CSHELL"
	elif [ -f "$YARRF_CUSTOM/plugins/$plugin/$plugin.plugin.sh" ]; then
		source "$YARRF_CUSTOM/plugins/$plugin/$plugin.plugin.sh"
	elif [ -f "$YARRF_CUSTOM/plugins/$plugin/_$plugin" ]; then
		source "$YARRF_CUSTOM/plugins/$plugin/_$plugin"
	elif [ -f "$YARRF/plugins/$plugin/$plugin.plugin.$CSHELL" ]; then
		source "$YARRF/plugins/$plugin/$plugin.plugin.$CSHELL"
	elif [ -f "$YARRF/plugins/$plugin/$plugin.plugin.sh" ]; then
		source "$YARRF/plugins/$plugin/$plugin.plugin.sh"
	elif [ -f "$YARRF/plugins/$plugin/_$plugin" ]; then
		source "$YARRF/plugins/$plugin/_$plugin"
	else
		echo "[yarrfiles] Plugin not found: ${plugin}"
	fi
done
