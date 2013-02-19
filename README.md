## Yarrfiles

Sail'n wit me booty across the seven seas.. Arr! Prepare to be Boarded!! -_O

## Features

- Loads global and environment-specific scripts, plugins and dotfiles.
- Feel at home on any nix box.
- Easy to maintain and extend.

## Setup

### Via `git`

`git clone git@github.com:ptahdunbar/yarrfiles.git ~/.yarrfiles && ~/.yarrfiles/bin/yarrfiles --init`

###### Background
- Upon installation, yarrfiles retrieves the current shell environment (suppots bash and zsh).
- Then it copies a template from the `~/yarrfiles/templates/` directory into your home directory.
- It performs a backup for any existing shell config as `~/.bashrc-pre-yarrfiles` or  `~/.zshrc-pre-yarrfiles`.

## Update

1. Yarr! `yarrfiles --update`
2. Arrr, set sail ye scury dogs!

###### Background
- Checks config for dotfiles and copies them over to your home directory.

## Configration

- Yarrfiles is completely controled by your shell configuration file (bashrc or zshrc).

### Configuration Options
- `YARRF_THEME`
- `dotfiles`
- `plugins`

## Choose `bash` or `zsh` environments

- Scripts and plugins are loaded based on the current shell environment, e.g. bash, or zsh.
- When creating a new script or plugin, you can specify which environment it's made for using the file extension, e.g. `script.bash`, `script.zsh`.
- You can declare the script as "global" so it runs regardless of environment by using the ".sh" file extension.
- Dotfiles are always loaded regardless of shell context.

## Dotfiles

- Yarrfiles distributes various dotfile configurations so your program configurations stays in-sync across machines.
- Dotfile definition: `/dotfiles/vimrc/vimrc`
- Files and folders included within the `/dotfiles/` directory are copied over to your home directory during the update process.
- You can control which dotfiles are copied over by adding/removing the directory slug from the `dotfiles` configuration option.
- You can override a dotfile distributed with yarrfiles by adding an entry within `/custom/dotfiles/` using the dotfile's directory slug.

## Plugins

- Plugins are a topical group of small scripts and configuration distributed within yarrfiles.
- Plugins definition: `/plugins/foo/foo.plugin.sh`
- Plugins included within the `/plugins/` directory are sourced during a new command prompt.
- You can control which plugins are sourced by adding/removing the directory slug from the `plugins` configuration option.
- You can override a plugin distributed with yarrfiles by adding an entry within `/custom/plugins/` using the plugin's directory slug.
- You can specify which environment the plugin should be loaded in by ending the file extension in `.bash`, `.zsh`, or `.sh` for always.

## Scripts & Functionality

- For small scripts and functionality, just add a new script file into the `/custom/` directory.
- You can specify which environment the script should be loaded in by ending the file extension in `.bash`, `.zsh`, or `.sh` for always.

## Executables

- Executables are shell scripts/programs that are available in the command prompt.
- The `/bin/` and `/custom/bin/` directories are exported to the `$PATH` global.

## Uninstall

1. Run `~/.yarrfiles/bin/yarrfiles --uninstall`
2. Arrr, set sail ye scury dogs!

## Credits
- [Robby Russell](http://planetargon.com/who-we-are/robby-russell) for [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
- [Zach Holman](http://zachholman.com/) for his [topical diretory structure layout](https://github.com/holman/dotfiles#topical)
- [Mathias Bynens](http://mathiasbynens.be/) for some of his [dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Ethan Schoonover](http://ethanschoonover.com/solarized) for [vim solarized theme](https://github.com/altercation/solarized)

