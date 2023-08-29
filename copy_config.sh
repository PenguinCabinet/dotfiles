echo "Make directories..."
mkdir "$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)/Downloads"
mkdir "$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)/Documents"
mkdir "$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)/Pictures"

echo "Link config files..."
while read e; do
    [ "$e" = ".git" ] && continue
    if [ "`echo $e | grep '.sh'`" ]; then
        continue
    fi
    [ "$e" = "TODO.md" ] && continue
    ln -snvf "$(pwd)/$e" "$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)/$e"
done < <(ls -A -1 ./)
