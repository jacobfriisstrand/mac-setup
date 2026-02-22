# Homebrew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# NVM install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# Apps/CLI tools install
xargs brew install < apps/installs.txt

# npkill install
npx npkill

# IDE extensions install
xargs -n 1 code --install-extension < ide/ide-extensions.txt