echo "Make directories..."
mkdir ~/Downloads
mkdir ~/Documents
mkdir ~/Pictures

echo "Link config files..."
while read e; do
    [ "$e" = ".git" ] && continue
    if [ "`echo $e | grep '.sh'`" ]; then
        continue
    fi
    ln -snvf "$(pwd)/$e" "$HOME/$e"
done < <(ls -A -1 ./)
