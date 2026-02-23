#!/usr/bin/env zsh

echo "Starting mac-setup...\n"

# 1. Package manager — everything depends on this
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Node version manager — needed before .zshrc is sourced
echo "\nInstalling NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# 3. Apps and CLI tools via Homebrew
echo "\nInstalling apps and CLI tools..."
xargs brew install < ~/mac-setup/apps/installs.txt

# 4. Dotfiles — .zshrc references NVM and ~/scripts, so both must exist first
echo "\nCopying dotfiles..."
mkdir -p ~/scripts
DOTFILES=(.zshrc .gitconfig .gitignore)
for dotfile in ${DOTFILES[*]}; do
    rm -f ~/$dotfile
    cp ~/mac-setup/dotfiles/$dotfile ~/$dotfile
done

# 5. VS Code extensions — needs VS Code installed from step 3
echo "\nInstalling VS Code extensions..."
xargs -n 1 code --install-extension < ~/mac-setup/ide/ide-extensions.txt

# 6. VS Code settings and keybindings (symlinked so edits stay in sync)
echo "\nLinking VS Code settings..."
VSCODE_DIR=~/Library/Application\ Support/Code/User
mkdir -p "$VSCODE_DIR"
ln -sf ~/mac-setup/ide/settings.json "$VSCODE_DIR/settings.json"
ln -sf ~/mac-setup/ide/keybindings.json "$VSCODE_DIR/keybindings.json"

# 7. Generate TaskSync reusable prompts from skill files
echo "\nGenerating TaskSync reusable prompts..."
PROMPTS_JSON="[]"
for skill in ~/mac-setup/ide/skills/*/SKILL.md; do
    skill_name=$(basename "$(dirname "$skill")")
    PROMPTS_JSON=$(jq --arg name "$skill_name" --rawfile prompt "$skill" -n --argjson arr "$PROMPTS_JSON" '$arr + [{"name": $name, "prompt": $prompt}]')
done
jq --argjson prompts "$PROMPTS_JSON" '.["tasksync.reusablePrompts"] = $prompts' ~/mac-setup/ide/settings.json > ~/mac-setup/ide/settings.json.tmp
mv ~/mac-setup/ide/settings.json.tmp ~/mac-setup/ide/settings.json

# 8. Stats menubar settings
echo "\nCopying Stats settings..."
cp ~/mac-setup/menubar-stats-settings/Stats.plist ~/Library/Preferences/eu.exelban.Stats.plist

# 9. IDE skills — symlinked so edits stay in sync
echo "\nLinking IDE skills..."
SKILLS_SRC=~/mac-setup/ide/skills
TARGETS=(~/.claude/skills ~/.copilot/skills)
for target in ${TARGETS[@]}; do
    mkdir -p "$target"
    for skill in "$SKILLS_SRC"/*/; do
        skill_name=$(basename "$skill")
        rm -rf "$target/$skill_name"
        ln -sf "$SKILLS_SRC/$skill_name" "$target/$skill_name"
    done
done

echo "\nSetup complete!"
