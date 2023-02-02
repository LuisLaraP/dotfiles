#! /bin/sh
#
# Dotfiles installation script
#
# This script needs to be run as the user for whom the dotfiles are to be installed.

repo_url="github:LuisLaraP/dotfiles.git"
target="$HOME/.dotfiles"

# Exit if the target alrady exists.
[ -e "$target" ] && echo "File or directory $target already exists. Remove it prior to installation." 1>&2 && exit

# Clone the remote repository
git clone --bare $repo_url "$target"
git --git-dir="$target" --work-tree=$HOME config status.showUntrackedFiles no
git --git-dir="$target" --work-tree=$HOME checkout -f

# Remove unnecessary files
git --git-dir="$target" --work-tree=$HOME update-index --skip-worktree $HOME/README.md $HOME/LICENSE
rm $HOME/README.md $HOME/LICENSE
