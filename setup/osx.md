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
curl            htop            libmpc          mysql           perl            tmux            zsh
gcc             hwloc           libusb          ncurses         python          tree            zsh-completions
gdbm            isl             libyaml         open-mpi        readline        vim             zsh-syntax-highlighting
gettext         k9s             lua             openssl@1.1     ruby            xz
git             kubernetes-cli  minikube        pcre            skaffold        youtube-dl
gmp             libevent        mpfr            pcre2           sqlite          z
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
alfred                        chrome-remote-desktop-host    firefox                       iterm2                        skim                          sublime-text
anki                          djview                        foxitreader                   karabiner-elements            skyfonts                      the-unarchiver
background-music              docker                        gitkraken                     macdjview                     skype                         vlc
calibre                       eqmac                         gnucash                       pycharm                       spectacle                     zotero
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
