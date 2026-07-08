TARGET=$1

# Get available targets from setup directory
TARGETS=($(ls -d ./setup/*/ | cut -d'/' -f3))

if [ -z "$TARGET" ]; then
    echo "Usage: $0 <target>"
    echo "Target can be one of the following:"
    for t in "${TARGETS[@]}"; do
        echo "  - $t"
    done
    exit 1
fi

sudo echo starting installation for $TARGET

# base will always run
bash ./setup/base/packages.sh
bash ./setup/base/symlink.sh

# OS-specific config
bash ./setup/$TARGET/packages.sh
bash ./setup/$TARGET/symlink.sh

source ~/.zshrc

fastfetch
echo
echo Done!
