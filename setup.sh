#!/bin/bash

set -e

echo "Installing Xcode Command Line Tools..."
xcode-select --install || true

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to PATH..."
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc

echo "Installing apps and tools via Brewfile..."
brew bundle --file=./Brewfile

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Configuring Powerlevel10k theme in .zshrc..."
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "Installing zsh plugins via Homebrew..."
brew install zsh-autosuggestions zsh-syntax-highlighting

echo "Adding plugins to .zshrc..."
echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

echo "Installing and configuring nvm..."
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"' >> ~/.zshrc
echo '[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"' >> ~/.zshrc

echo "Basic installation completed!"
echo "Remember to configure your SSH keys and dotfiles as per the instructions in the README."
