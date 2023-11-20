# Mac OS X Setup
Generally, follow the instructions [here](http://sourabhbajaj.com/mac-setup/).

## Steps

1.  Install brew
2.  Install Visual Studio Code
    *   brew install visual-studio-code
    *   Sync VS Code config
3.  Clone dotfiles
4.  Install karabiner-elements
5.  Symlink dotfiles/karabiner*.json to ~/.config/karabiner
6.  Install fonts
    *   brew tap homebrew/cask-fonts
    *   brew install font-fira-code-nerd-font font-hack-nerd-font
7.  Setup alacritty
    *   brew install alacritty
    *   tic -xe alacritty,alacritty-direct /path/to/alacritty.info
    *   Right-click -> Open from Applications during first use
8.  Install other casks and formulae
9.  Setup zsh
    *   brew install zsh z fzf tmux ripgrep
    *   Symlink the following:
        *   .aliases
        *   .gitconfig
        *   .oh-my-zsh
        *   .tmux.conf
        *   .vim
        *   .zshrc
10. Setup Conda
    *   brew install miniconda|miniforge
11. Setup nvim
    *

## Formulae
```
aom
autoconf
automake
bat
bdw-gc
berkeley-db
brotli
c-ares
cairo
cmake
curl
dav1d
dotnet
fd
ffmpeg
flac
fontconfig
freetds
freetype
frei0r
fribidi
fzf
gcc
gd
gdbm
gdk-pixbuf
gettext
ghostscript
giflib
git
git-delta
glib
gmp
gnutls
go
gobject-introspection
graphite2
graphviz
gts
guile
harfbuzz
haskell-stack
htop
hwloc
icu4c
isl
jansson
jasper
jemalloc
jpeg
k9s
kubernetes-cli
lame
leptonica
libass
libbluray
libev
libevent
libffi
libidn2
libmagic
libmetalink
libmpc
libogg
libpng
libpthread-stubs
librsvg
libsamplerate
libsndfile
libsodium
libsoxr
libssh2
libtasn1
libtermkey
libtiff
libtool
libunistring
libusb
libuv
libvidstab
libvorbis
libvpx
libvterm
libx11
libxau
libxcb
libxdmcp
libxext
libxrender
libyaml
little-cms2
lua
luajit
lzo
minikube
mpdecimal
mpfr
msgpack
mysql
ncurses
neovim
netpbm
nettle
nghttp2
open-mpi
opencore-amr
openjdk
openjpeg
openldap
openssl@1.1
opus
p11-kit
pango
pcre
pcre2
perl
pixman
pkg-config
protobuf
pygments
python@3.8
python@3.9
rav1e
readline
redis
ripgrep
rtmpdump
rubberband
ruby
sdl2
skaffold
snappy
speex
sqlite
srt
starship
tcl-tk
tesseract
the_silver_searcher
theora
tmux
tree
tree-sitter
unbound
unibilium
universal-ctags
unixodbc
utf8proc
vim
watch
webp
wget
x264
x265
xorgproto
xvid
xz
yamllint
youtube-dl
z
zeromq
zimg
zsh
zsh-completions
zsh-syntax-highlighting
zstd
```

## Casks
```
4k-video-downloader
alacritty
alfred
anki
arduino
background-music
brave-browser
caffeine
calibre
chrome-remote-desktop-host
djview
docker
eqmac
firefox
font-fira-code-nerd-font
font-hack-nerd-font
gnucash
intel-power-gadget
iterm2
julia
kap
karabiner-elements
keycastr
kindle-previewer
kite
krita
macdjview
mactex
netlogo
nvalt
obsidian
pdfelement
postman
pycharm
rstudio
skim
skyfonts
skype
soundflower
soundflowerbed
spectacle
sublime-text
tg-pro
the-unarchiver
turbo-boost-switcher
visual-studio-code
vlc
zotero
```

```
[I] ➜ brew list
==> Formulae
zsh z fzf tmux ripgrep nvm

apr		dive		fontconfig	gdbm		go		jsonnet		libevent	libtiff		mpdecimal		pcre		protobuf			xz
apr-util		freetype	gettext		jbig2dec	k9s		libidn		little-cms2	mysql		openjpeg	pcre2		python@3.9	sqlite		utf8proc
bat		fd			ghostscript	jpeg		kubernetes-cli	libpng		lz4		ncurses		openssl@1.1	poetry		readline	subversion	vksctl

==> Casks
alfred
caffeine
visual-studio-code
karabiner-elements
font-hack-nerd-font
font-fira-code-nerd-font
miniconda/miniforge
alacritty
rectangle
the-unarchiver
slack
brave-browser
skype
zoom
docker

adobe-acrobat-pro								mactex
adobe-acrobat-reader		anki				calibre				firefox				gnucash				keycastr			mendeley			postman
			djview					intel-power-gadget		krita				menumeters
```
