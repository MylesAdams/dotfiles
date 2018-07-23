#!/bin/bash

# Make folders
mkdir ~/Programs

# Nvidia Drivers and Update
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt install nvidia-390

# Install programs
sudo apt-get install chromium-browser ranger emacs compton tilix rofi python3 python3-pip python-pip zip unzip thunderbird

# Install utilities
sudo apt-get install colordiff curl

# Install snaps
sudo snap install spotify

# Install Python2 libraries
pip install appdirs asn1crypto astroid backports.functools-lru-cache beautifulsoup4 certifi chardet configparser cryptography decorator enum34 epc eventlet flake8 fudge funcsigs future futures fuzzywuzzy gmusicapi gpsoauth greenlet httplib2 idna importmagic ipaddress isort keyring keyrings.alt lazy-object-proxy logilab-common lxml mccabe MechanicalSoup mock mutagen netifaces oauth2client pafy pbr pip PlexAPI proboscis protobuf pyasn1 pyasn1-modules pycairo PyChromecast pycodestyle pycountry pycrypto pycryptodomex pyflakes pygobject pylint python-dateutil pyxdg ranger requests rsa SecretStorage setuptools sexpdata simplejson singledispatch six soundcloud spotipy titlecase tizchromecastproxy tizdirbleproxy tizgmusicproxy tizplexproxy tizsoundcloudproxy tizspotifyproxy tizyoutubeproxy tqdm urllib3 validictory websocket-client wheel wrapt yapf youtube-dl zeroconf

# Install Python3 libraries
pip3 install apturl asn1crypto astroid Brlapi certifi chardet command-not-found cryptography cupshelpers cycler defer distro-info docopt epc flake8 httplib2 idna imageio importmagic isort keyring keyrings.alt kiwisolver language-selector launchpadlib lazr.restfulclient lazr.uri lazy-object-proxy logilab-common louis macaroonbakery Mako MarkupSafe matplotlib mccabe meson numpy oauth olefile onboard pexpect Pillow pip protobuf pycairo pycodestyle pycrypto pycups pyflakes pygobject pylint pymacaroons PyNaCl pyparsing pyRFC3339 python-apt python-dateutil python-debian pytz pyxdg PyYAML reportlab requests requests-unixsocket scipy screen-resolution-extra SecretStorage setuptools sexpdata simplejson six system-service systemd-python ubuntu-drivers-common ufw unattended-upgrades urllib3 usb-creator wadllib wheel wrapt xdiagnose xkit yapf zope.interface

# i3-gaps dependencies
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake

# non-critical i3-gaps dependencies (scripts and stuff)
sudo apt-get install feh dmenu kde-spectacle wmctrl gnome-screensaver

# Install i3-gaps
cd ~/Programs/
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make -j8
sudo make install
cd ~/

# i3blocks script dependencies
sudo apt-get install lm-sensors alsa-base pulseaudio sysstat acpi

# Setting up scripts & layouts for i3
mkdir ~/scripts
mkdir ~/.config/i3/layouts
sudo cp ~/dotfiles/work/i3/scripts/* ~/scripts
sudo cp ~/dotfiles/work/i3/layouts/* ~/.config/i3/layouts/

# Settings up sensors for i3blocks
sudo sensors-detect
sudo service kmod start

# Install playerctl
wget https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb -P ~/Downloads/
sudo apt install ~/Downloads/playerctl-0.6.1_amd64.deb
sudo rm playerctl-0.6.1_amd64.deb

# Install i3blocks-gaps
cd ~/Programs/
git clone git://github.com/vivien/i3blocks i3blocks
cd i3blocks
make clean all
sudo make install
cd ~/

# Bash setup
sudo cp ~/dotfiles/work/bashrc ~/.bashrc
sudo cp ~/dotfiles/work/bash_aliases ~/.bash_aliases
source ~/.bashrc

# i3-gaps setup
mkdir ~/.config/i3/
sudo cp ~/dotfiles/work/i3/config ~/.config/i3/config
sudo cp ~/dotfiles/work/i3/exit_menu.sh ~/.config/i3/

# i3-blocks setup
sudo cp ~/dotfiles/work/i3blocks/i3blocks.conf ~/.i3blocks.conf
shopt -s extglob
sudo cp ~/dotfiles/work/i3blocks/!(*.conf) /usr/local/libexec/i3blocks/
shopt -u extglob

# Compton setup
sudo cp ~/dotfiles/work/compton/compton.conf ~/.config/compton.conf

# Tilix setup
sudo mkdir -p ~/.config/tilix/schemes/
sudo cp ~/dotfiles/work/tilix/themes/nord.json ~/.config/tilix/schemes/
dconf load /com/gexperts/Tilix/ < ~/dotfiles/work/tilix/tilix.dconf
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Ranger setup
ranger --copy-config=all
sudo cp ~/dotfiles/work/ranger/rc.conf ~/.config/ranger/

# Rofi setup
mkdir ~/.config/rofi
sudo cp ~/dotfiles/work/rofi/* ~/.config/rofi

# Spacemacs setup
sudo rm -r ~/.emacs.d/
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo cp ~/dotfiles/work/spacemacs/spacemacs ~/.spacemacs

# Fonts setup
cd ~/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FantasqueSansMono.zip
unzip FantasqueSansMono.zip -d fantasque
shopt -s extglob
sudo cp ./fantasque/!(*Windows*) /usr/local/share/fonts/
shopt -u extglob

wget https://github.com/be5invis/Iosevka/releases/download/v1.14.3/02-iosevka-term-1.14.3.zip
unzip 02-iosevka-term-1.14.3.zip -d iosevka
sudo cp ./iosevka/ttf/* /usr/local/share/fonts/

git clone https://github.com/domtronn/all-the-icons.el.git
sudo cp ./all-the-icons.el/fonts/*.ttf /usr/local/share/fonts/

sudo rm FantasqueSansMono.zip
sudo rm -r fantasque
sudo rm 02-iosevka-term-1.14.3.zip
sudo rm -r iosevka
sudo rm -r all-the-icons.el
cd ~/

# Wallpaper setup
mkdir ~/Documents/wallpapers/
sudo cp ~/dotfiles/work/wallpaper.jpg ~/Documents/wallpapers/

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
