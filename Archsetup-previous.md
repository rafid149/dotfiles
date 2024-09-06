swww


wl-clipboard




opencv ( for material colors c++ image )





python-materialyoucolor-git (from yay) (
Packages (7) libimagequant-4.3.1-1  libraqm-0.10.1-1  python-pyproject-hooks-1.1.0-1  python-build-1.2.1-3
             python-installer-0.7.0-8  python-pillow-10.3.0-2  python-wheel-0.43.0-4
) (used to create material colors, but then used matugen instead, but didn't remove it for later python projects)




xdg-desktop-portal-hyprland (hyprland's website see: xdg-desktop-portal)



imagemagick ( to render images using fastfetch )





zathura
zathura-djvu
zathura-pdf-mupdf





screen-dispatcher ( required for firefox, otherwise it gives some errors in some websites such as canva.com )





tree-sitter-cli ( to setup treesitter on latex )







tlmgr packages{
tcolorbox
tikzfill
haranoaji ( required for "luatexja" a package alternative to fontspec in xelatex for lualatex)
fontawesome
mdframed
zref ( for mdframed )
needspace (for mdframed)
}








zsh-autosuggestions, starship, ohmyzsh ( zsh setup )





thunar (file manager)





swaync (for notification testing purpose)
(It installed the following packages:
granite gvfs libcdio libcdio-paranoia libgee libhandy
swaync
)



Install necessary packages for ibus ( I didn't install it by myself )
installed gnome-bluetooth to test aylur's ags






















dotfiles
cava
fastfetch
tmux
ags
nvim
kitty
hyprland
texlive






























# Virt Manager Setup
sudo pacman -S qemu-full virt-manager
sudo systemctl enable libvirtd.service
sudo pacman -S dnsmasq ( To fix some errors regarding libvirtd.service, Probably I should've installed it before enabling the service)


















# Don't Delete Backup Folder
