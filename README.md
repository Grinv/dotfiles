```sh
brew install stow
stow -t ~/.config nvim
```

Konsole (KDE): `~/.local/share/konsole` is a symlink to `konsole/konsole`, so edits made in Konsole's
settings land here. The default profile lives in `~/.config/konsolerc` (not tracked, Konsole keeps window
state there):

```sh
ln -s ~/Documents/dotfiles/konsole/konsole ~/.local/share/konsole
kwriteconfig6 --file konsolerc --group "Desktop Entry" --key DefaultProfile KanagawaWave.profile
```
