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
    rm -r "$HOME/$e"
    ln -s "$(pwd)/$e" "$HOME/$e"
done < <(ls -A -1 ./)

cd .config
while read e; do
    [ "$e" = ".git" ] && continue
    if [ "`echo $e | grep '.sh'`" ]; then
        continue
    fi
    rm -r "$HOME/.config/$e"
    ln -s "$(pwd)/$e" "$HOME/.config/$e"
done < <(ls -A -1 ./)
cd ..