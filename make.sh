#!/bin/bash

# Get the absolute path of the directory where the script is located
DOTFILES_BASE=$(pwd)

echo "Setting up dotfiles from: $DOTFILES_BASE"
echo "------------------------------------------"

# Define a map of directories and the files within them to link
# Format: "directory:file1 file2"
CONFIGS=(
    "vim_conf:.vim .vimrc"
    "tmux_conf:.tmux.conf"
)

for ENTRY in "${CONFIGS[@]}"; do
    # Split the entry into directory and files
    DIR="${ENTRY%%:*}" # removes everyhting after the ":"
    FILES="${ENTRY#*:}" # removes everything before the ":"

    for FILE in $FILES; do
        SOURCE="$DOTFILES_BASE/$DIR/$FILE"
        TARGET="$HOME/$FILE"

        # Skip if source doesn't exist
        if [ ! -e "$SOURCE" ]; then
            echo "Skipping: $SOURCE (not found)"
            continue
        fi

        # Remove existing target (file, dir, or symlink)
        if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
            echo "Removing existing $TARGET"
            rm -rf "$TARGET"
        fi

        # Create symlink
        echo "Linking $SOURCE -> $TARGET"
        ln -s "$SOURCE" "$TARGET"
    done
done
