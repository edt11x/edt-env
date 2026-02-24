#!/usr/bin/env bash
set -euo pipefail
set -x 

is_qubes_template() {
    # Check if the qubesdb-read command exists (indicates a Qubes VM)
    if command -v qubesdb-read &> /dev/null; then
        # Read the VM type from the Qubes database
        # Type 1 typically means TemplateVM
        VM_TYPE=$(qubesdb-read /qubes-vm-type 2>/dev/null)

        # Check if the type is exactly '1'
        if [[ "$VM_TYPE" == "1" ]]; then
            return 0 # Success (is a template)
        fi
    fi

    return 1 # Failure (is not a template or not a Qubes VM)
}

if [[ -f /etc/yum.repos.d/google-chrome.repo ]]; then
    sudo sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/google-chrome.repo
fi

sudo dnf upgrade -y --refresh --best
sudo dnf config-manager addrepo --from-repofile=https://packages.microsoft.com/yumrepos/edge/config.repo --overwrite
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc || sudo rpm --import ./microsoft.asc
sudo rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub || sudo rpm --import ./linux_signing_key.pub
sudo rpm --import https://www.scootersoftware.com/RPM-GPG-KEY-scootersoftware || sudo rpm --import ./RPM-GPG-KEY-scootersoftware
sudo rpm --import https://linux.dropbox.com/fedora/rpm-public-key.asc || sudo rpm --import ./rpm-public-key.asc
sudo dnf update --refresh
sudo dnf -y --best install microsoft-edge-stable

# Want to use the Node Version Manager, nvm, to allow multiple versions
sudo dnf remove -y nodejs nodejs-npm || true

# Big install
PACKAGES=(
    meld vim-X11 vim-minimal gawk make wget tar bzip2 gzip python3 unzip perl 
    patch diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath 
    ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum 
    socat findutils which file cpio python3-pip xz python3-GitPython 
    python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin 
    perl-File-Compare perl-File-Copy perl-locale zstd lz4 python3-matplotlib 
    python3-pandas python3-tkinter ripgrep fira-code-fonts gnu-free-sans-fonts 
    google-arimo-fonts google-carlito-fonts google-cousine-fonts 
    google-crosextra-caladea-fonts google-droid-fonts-all google-droid-sans-fonts 
    google-droid-sans-mono-fonts google-droid-serif-fonts google-go-fonts 
    google-go-mono-fonts google-go-smallcaps-fonts google-roboto-condensed-fonts 
    google-roboto-fonts google-roboto-mono-fonts google-roboto-slab-fonts 
    google-rubik-fonts google-tinos-fonts mozilla-fira-fonts-common 
    mozilla-fira-mono-fonts mozilla-fira-sans-fonts mozilla-zilla-slab-fonts 
    mozilla-zilla-slab-fonts-common mozilla-zilla-slab-highlight-fonts 
    open-sans-fonts docker docker-compose docker-distribution qemu-user-static 
    qemu-user-binfmt libgnome nautilus mtr mtr-gtk traceroute bind-utils 
    gvfs-fuse gvfs-smb liberation-fonts cmake c-ares c-ares-devel libcurl 
    libcurl-devel libev libev-devel tmux htop glances google-android-emoji-fonts 
    google-noto-color-emoji-fonts google-noto-emoji-fonts default-fonts-core-emoji 
    twitter-twemoji-fonts default-fonts-core rust cargo iptraf-ng lxc-devel 
    lxc-libs lxc lxc-templates sshpass libreoffice-writer perl-File-DirCompare 
    pip python3-pip fuse fuse3 snap par2cmdline cairo-devel pango-devel 
    libjpeg-turbo-devel giflib-devel swaks nmap gnome-todo ksshaskpass 
    libappindicator libappindicator-gtk3 rpmfusion-free-release okular 
    emoji-picker uv gnome-calendar remind baobab flatpak qelectrotech screen 
    xfce4-statusnotifier-plugin gnome-weather automake autoconf m4 bison flex 
    kernel-devel libtirpc-devel libaio-devel numactl-devel protobuf-c-devel 
    libacl-devel knot-utils ShellCheck
)

echo "Installing main packages..."
sudo dnf -y --best --skip-unavailable install "${PACKAGES[@]}"

sudo dnf makecache
echo "=================================================="
echo "Other package managers"
echo "=================================================="
echo "Trying pip"
pip install wic kas anthropic

mkdir -p "$HOME/.tmux"
