#!/usr/bin/env bash
/usr/sbin/softwareupdate --install-rosetta --agree-to-license


#Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo 'Please install Homebrew by running the following command: arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)")"
"'
else
    brew update
fi

#Upgrade installed formulae
brew upgrade

# Save Homebrew’s installed location
BREW_PREFIX=$(brew --prefix)

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



# Powerlevel10k
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts


# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install node 12

#Xcode install
xcode-select --install



brew install \
zsh \
wget \
gmp \
grep \
git \
gh \
mysql \
react-native-cli \
starship \
watchman \
php \




# Start Services
brew services start


# Brew Casks install
brew install --cask \
  raycast \
  bitwarden \
  firefox \
  visual-studio-code \
  docker \
  slack \
  discord \
  signal \
  vlc \
  calibre \
  figma \
  imageoptim \
  maccy \
  protonvpn \
  zoom \
  sequel-ace \
  ngrok \
  keycastr \
  obsidian \
  airtable \



# Composer 
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer


composer global require laravel/valet
valet install

# Remove outdated versions from the cellar.
brew cleanup