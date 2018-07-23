#!/bin/bash

# Make folders
mkdir ~/Programs
mkdir ~/scripts

# Nvidia Drivers and Update
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt install -y nvidia-390

# Install programs
sudo apt-get install -y chromium-browser ranger emacs compton tilix rofi python3 python3-pip python-pip zip unzip dunst

# Install utilities
sudo apt-get install -y colordiff curl

# Install snaps
sudo snap install spotify discord

# Python 2 Libraries
pip install ansible apache-libcloud asn1crypto certifi chardet Cheetah cryptography enum34 funcsigs httplib2 idna ipaddress Jinja2 jmespath keyring keyrings.alt lockfile MarkupSafe mock netaddr paramiko pbr pip pyasn1 pycrypto pycurl pygobject pykerberos pyOpenSSL pyxdg PyYAML ranger requests SecretStorage setuptools simplejson six spectacle urlgrabber urllib3 wheel xmltodict

# Python 3 Libraries
pip install apt-xapian-index apturl asn1crypto Brlapi certifi chardet command-not-found cryptography cupshelpers defer distro-info httplib2 idna keyring keyrings.alt language-selector launchpadlib lazr.restfulclient lazr.uri louis macaroonbakery Mako MarkupSafe oauth olefile pexpect Pillow pip protobuf pycairo pycrypto pycups pygobject pymacaroons PyNaCl PyQt5 PyQt5-sip pyRFC3339 python-apt python-debian pytz pyxdg PyYAML reportlab requests requests-unixsocket ruamel.yaml screen-resolution-extra SecretStorage setuptools simplejson six system-service systemd-python ubuntu-drivers-common ufw unattended-upgrades urllib3 usb-creator wadllib wheel whither xkit zope.interface

# i3-gaps dependencies
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake

# Non-critical i3-gaps dependencies (scripts and stuff)
sudo apt-get install -y feh dmenu kde-spectacle wmctrl

# Install i3-gaps
cd ~/Programs/
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make -j6
sudo make install
cd ~/

# i3blocks script dependencies
sudo apt-get install -y lm-sensors alsa-base pulseaudio sysstat acpi

# Settings up sensors for i3blocks
sudo sensors-detect
sudo service kmod start

# Install playerctl
wget https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb -P ~/Downloads/
sudo apt install -y ~/Downloads/playerctl-0.6.1_amd64.deb
sudo rm playerctl-0.6.1_amd64.deb

# Install i3blocks-gaps
cd ~/Programs/
git clone git://github.com/vivien/i3blocks i3blocks
cd i3blocks
make clean all
sudo make install
cd ~/

# Bash setup
sudo cp -r ~/dotfiles/home/bashrc ~/.bashrc
sudo cp -r ~/dotfiles/home/bash_aliases ~/.bash_aliases
source ~/.bashrc

# i3-gaps setup
mkdir -p ~/.config/i3/layouts
sudo cp -r ~/dotfiles/home/i3/config ~/.config/i3/config
sudo cp -r ~/dotfiles/home/i3/layouts/* ~/.config/i3/layouts/

# i3-blocks setup
sudo cp -r ~/dotfiles/home/i3blocks/i3blocks.conf ~/.i3blocks.conf
shopt -s extglob
sudo cp -r ~/dotfiles/home/i3blocks/!(*.conf) /usr/local/libexec/i3blocks/
shopt -u extglob

# Compton setup
sudo cp -r ~/dotfiles/home/compton/compton.conf ~/.config/compton.conf

# Dunst setup
mkdir ~/.config/dunst/
sudo cp -r ~/dotfiles/home/dunst/dunstrc ~/.config/dunst/

# Tilix setup
sudo mkdir -p ~/.config/tilix/schemes/
sudo cp -r ~/dotfiles/home/tilix/themes/Chalk_slight_change.json ~/.config/tilix/schemes/
dconf load /com/gexperts/Tilix/ < ~/dotfiles/home/tilix/tilix.dconf
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Ranger setup
ranger --copy-config=all
sudo cp -r ~/dotfiles/home/ranger/rc.conf ~/.config/ranger/

# Rofi setup
mkdir ~/.config/rofi/
sudo cp -r ~/dotfiles/home/rofi/* ~/.config/rofi/

# Spacemacs setup
sudo rm -r ~/.emacs.d/
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo cp -r ~/dotfiles/home/spacemacs/spacemacs ~/.spacemacs

# Other setup
# Scripts
sudo cp -r ~/dotfiles/home/scripts/* ~/scripts/
# Gotop
git clone --depth 1 https://github.com/cjbassi/gotop /tmp/gotop
/tmp/gotop/scripts/download.sh
sudo mv ~/gotop /usr/local/bin

# Fonts setup
cd ~/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FantasqueSansMono.zip
unzip FantasqueSansMono.zip -d fantasque
shopt -s extglob
sudo cp -r ./fantasque/!(*Windows*) /usr/local/share/fonts/
shopt -u extglob

wget https://github.com/be5invis/Iosevka/releases/download/v1.14.3/02-iosevka-term-1.14.3.zip
unzip 02-iosevka-term-1.14.3.zip -d iosevka
sudo cp -r ./iosevka/ttf/* /usr/local/share/fonts/

git clone https://github.com/domtronn/all-the-icons.el.git
sudo cp -r ./all-the-icons.el/fonts/*.ttf /usr/local/share/fonts/

sudo rm FantasqueSansMono.zip
sudo rm -r fantasque
sudo rm 02-iosevka-term-1.14.3.zip
sudo rm -r iosevka
sudo rm -r all-the-icons.el
cd ~/

# Wallpaper setup
mkdir ~/Documents/wallpapers/
sudo cp -r ~/dotfiles/home/wallpaper.jpg ~/Documents/wallpapers/

bool=0
while [[ $bool == 0 ]]; do
    bool=1
    read -p "You must restart to enable i3. Would you like to do so now? (y/n)" restart
    if [[ "$restart" == "y" || "$restart" == "Y" ]]; then
	      sudo reboot
    elif [[ "$restart" == "n" || "$restart" == "N" ]]; then
        echo "Setup finished."
    else
        bool=0
        echo "Invalid input"
    fi
done
