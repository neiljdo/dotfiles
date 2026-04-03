#!/usr/bin/env bash
# Opens Brave extension install pages in bulk.
# Confirm each install in the browser prompt.

extensions=(
  # Privacy & Security
  "cjpalhdlnbpafiamejdnhcphjbkeiagm"  # uBlock Origin
  "ghmbeldphafepmbegfdlkpapadhbakde"  # Proton Pass

  # Dev Tools
  "dbepggeogbaibhgnhhndojpepiihcmeb"  # Vimium
  "hlepfoohegkhhmjieoechaddaejaokhf"  # Refined GitHub
  "dgjhfomjieapoollkpinjggjioljehan"  # Sourcegraph
  "gppongmhjkpfnbhagpmjfkannfbllamg"  # Wappalyzer
  "gbmdgpbipfallnflgajpaliibnhdgobh"  # JSON Viewer
  "bhlhnicpbhignbdhedgjhgdocnmhomnp"  # ColorZilla
  "jabopobgcpjmedljpbcaablpmlmfcogm"  # WhatFont
  "bijpdibkloghppkbmhcklkogpjaenfkg"  # Auto Copy
  "hnafhkjheookmokbkpnfpmemlppjdgoi"  # Allow Right-Click

  # Tab & Window Management
  "jappgmhllahigjolfpgbjdfhciabdnde"  # Link Map

  # Research & Reading
  "ekhagklcjbdpajgpjgmbionohlpdbjgc"  # Zotero Connector
  "ldgfbffkinooeloadekpmfoklnobpien"  # Raindrop.io
  "bjfhmglciegochdpefhhlphglcehbmek"  # Hypothesis
  "aikkeehnlfpamidigaffhfmgbkdeheil"  # CatalyzeX
  "mnhdpeipjhhkmlhlcljdjpgmilbmehij"  # arxiv-utils

  # AI Tools
  "hlgbcneanomplepojfcnclggenpcoldo"  # Perplexity AI Companion

  # Productivity
  "jlmpjdjjbgclbocgajdjefcidcncaied"  # daily.dev
  "pganeibhckoanndahmnfggfoeofncnii"  # Cold Turkey Blocker
  "kbfnbcaeplbcioakkpcpgfkobkghlhen"  # Grammarly
  "pncfbmialoiaghdehhbnbhkkgmjanfhe"  # uBlacklist

  # Media & YouTube
  "ponfpcnoihfmfllpaingbgckeeldkhle"  # Enhancer for YouTube
  "fkchdogohkjpnhfkganifkbbjcjofbjf"  # Better Subscriptions for YouTube
  "hoombieeljmmljlkjmnheibnpciblicm"  # Language Reactor

  # Utilities
  "eimadpbcbfnmbkopoojfekhnkhdbieeh"  # Dark Reader
  "immpkjjlgappgfkkfieppnmlhakdmaab"  # Imagus
  "neebplgakaahbhdphmkckjjcegoiijjo"  # Keepa
  "paebljbhhfgngkcldmbcogmkgegjgmbg"  # Coolors for Chrome
  "kekjfbackdeiabghhcdklcdoekaanoel"  # MAL-Sync
)

for id in "${extensions[@]}"; do
  open "https://chrome.google.com/webstore/detail/$id"
  sleep 0.5
done
