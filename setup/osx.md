# Mac OS X Setup
Generally, follow the instructions [here](http://sourabhbajaj.com/mac-setup/).

## `brew install`
```
$ brew list
aom             graphite2       libtool         readline
bash            graphviz        libunistring    rtmpdump
cabal-install   gts             libvorbis       rubberband
cairo           harfbuzz        libvpx          ruby
cmake           haskell-stack   libyaml         sdl2
djvulibre       icu4c           little-cms2     snappy
ffmpeg          isl             lua             speex
flac            jasper          lzo             sqlite
fontconfig      jpeg            mpfr            tesseract
freetype        lame            ncurses         theora
frei0r          leptonica       netpbm          tmux
fribidi         libass          nettle          tree
gcc             libbluray       openblas        unbound
gd              libevent        opencore-amr    vim
gdbm            libffi          openjpeg        webp
gettext         libidn2         openssl         x264
ghc             libmpc          opus            x265
ghostscript     libogg          p11-kit         xvid
giflib          libpng          pcre            xz
git             libsamplerate   pcre2           youtube-dl
glib            libsndfile      perl            z
gmp             libsoxr         pixman          zsh
gnutls          libtasn1        python          zsh-syntax-highlighting
go              libtiff         r               zstd

$ brew list
curl			hwloc			lua			    pcre2			tmux			zsh
gcc 			isl			    minikube		perl			tree			zsh-completions
gdbm			k9s			    mpfr			python			vim             zsh-syntax-highlighting
gettext			kubernetes-cli	mysql			python@3.8		watch
git 			libevent		ncurses			readline		xz
gmp	    		libmpc			open-mpi		ruby			yamllint
haskell-stack	libusb			openssl@1.1		skaffold		youtube-dl
htop			libyaml			pcre			sqlite			z
```

## `brew cask install`
```
$ brew cask install \
    alfred \
    android-file-transfer \
    anki \
    appcleaner \
    betterzipql \
    brave \
    caffeine \
    cheatsheet \
    docker \
    doubletwist \
    flux \
    gitkraken \
    google-backup-and-sync \
    google-hangouts \
    iterm2 \
    karabiner-elements \
    lastpass \
    macdjview \
    notational-velocity \
    onedrive \
    qlcolorcode \
    qlmarkdown \
    qlprettypatch \
    qlstephen \
    quicklook-csv \
    quicklook-json \
    resilio-sync \
    skyfonts \
    skype \
    spectacle \
    sublime-text \
    superduper \
    suspicious-package \
    torbrowser \
    totalfinder \
    transmission \
    vlc \
    webpquicklook
$ brew cask list
alfred                  flux                    java                    rstudio                 sublime-text
android-file-transfer   foxitreader             java6                   secure-pipes            the-unarchiver
anki                    gitkraken               karabiner-elements      skim                    transmission
background-music        gnucash                 licecap                 skyfonts                vlc
calibre                 google-backup-and-sync  macdjview               skype                   zotero
djview                  google-chrome           mactex                  slack
docker                  iterm2                  qbittorrent             spectacle
# With issues
$ brew cask install \
    asepsis \                               # permission errors
    dropbox \                               # repeat
    latexian \                              # not available anymore
    pdftk                                   # not available anymore
    valentina-studio \                      # repeat

$ brew cask list
alfred                         djview                         gitkraken                      pycharm                        sublime-text
anki                           docker                         gnucash                        skim                           the-unarchiver
background-music               eqmac                          iterm2                         skyfonts                       visual-studio-code
calibre                        firefox                        karabiner-elements             skype                          vlc
chrome-remote-desktop-host     foxitreader                    macdjview                      spectacle                      zotero
```

# Sublime Packages
## Installed
- A File Icon
- Advanced New File
- All Autocomplete
- Anaconda
- Apache Hive
- Boxy Theme
- BracketHighlighter
- Color Highlighter
- ColorHelper
- GitGutter
- Markdown Preview
- MarkdownEditing
- Package Control
- Pretty JSON
- SideBarEnhancements
- UnicodeMath

## Installed Previously
- API Blueprint
- Babel
- Boxy Theme Addon - Unified Mode
- Djaneiro
- Emmet
- HTML5
- Jinja2
- PyV8
- Sass
- Typescript
- Zeal
- zzz A File Icon zzz

More suggested packages [here](http://sourabhbajaj.com/mac-setup/SublimeText/Plugins.html).

## Steps

1.  Install brew
3.  Clone dotfiles
4.  Install karabiner-elements
5.  Symlink dotfiles/karabiner*.json to ~/.config/karabiner
6.  Install other casks
7.  Symlink Sublime packages dir
8.  Install zsh
9.  Symlink:
    *   .aliases
    *   .gitconfig
    *   .oh-my-zsh
    *   .tmux.conf
    *   .zshrc
10. Set-up anaconda locally

## Formulae
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

## Casks
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
