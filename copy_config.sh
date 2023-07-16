echo "Make directories..."
mkdir ~/Downloads
mkdir ~/Documents
mkdir ~/Pictures

echo "Link config files..."
for e in .??*; do
    [ "$e" = ".git" ] && continue
    if [ "`echo $e | grep '.sh'`" ]; then
        continue
    fi
    rm -r "$HOME/$e"
    ln -s "$(pwd)/$e" "$HOME/$e"
done

cd .config
for e in ??*; do
    [ "$e" = ".git" ] && continue
    if [ "`echo $e | grep '.sh'`" ]; then
        continue
    fi
    rm -r "$HOME/.config/$e"
    ln -s "$(pwd)/$e" "$HOME/.config/$e"
done
cd ..