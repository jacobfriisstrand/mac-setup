## Mac Setup

Personal macOS development environment setup. Run `setup.sh` to:

1. Install Homebrew and NVM
2. Install apps and CLI tools (`apps/installs.txt`)
3. Symlink dotfiles (`.zshrc`, `.gitconfig`, `.gitignore`)
4. Install VS Code extensions (`ide/ide-extensions.txt`)
5. Copy VS Code settings and keybindings (`ide/settings.json`, `ide/keybindings.json`)
6. Copy Stats menubar settings
7. Symlink IDE skills to `~/.claude/skills` and `~/.copilot/skills`

```sh
git clone https://github.com/jacobfriisstrand/mac-setup.git ~/mac-setup
cd ~/mac-setup && ./setup.sh
```
