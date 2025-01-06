#/bin/bash/

is_installed() {
  command -v $1 &>/dev/null
}

# Update system and install dependencies
echo "Updating system and installing dependencies..."
sudo pacman -Syu --needed base-devel git

# Check if yay is installed, if not, install it
if ! is_installed yay; then
  echo "yay is not installed. Installing yay..."
  git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si
  cd ..
else
  echo "yay is already installed. Skipping yay installation."
fi
