#!/usr/bin/env bash
# OPSEC Installer (PRANK)
# Does nothing real: no downloads, no file changes, no network access.
# It only prints fake progress and a joke ending.

# --- colors ---
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'
CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

# Ctrl+C gets a joke too
trap 'echo -e "\n${RED}[!] Cannot abort. Your OPSEC is already compromised.${NC}"; sleep 1; echo -e "${YELLOW}(Just kidding. Nothing was installed. You got pranked.)${NC}"; exit 0' INT

spinner() {
  local msg="$1" secs="${2:-3}"
  local frames='|/-\'
  local end=$((SECONDS + secs))
  local i=0
  while [ $SECONDS -lt $end ]; do
    printf "\r${CYAN}[%s]${NC} %s" "${frames:i++%4:1}" "$msg"
    sleep 0.15
  done
  printf "\r${GREEN}[OK]${NC} %s\n" "$msg"
}

progress_bar() {
  local label="$1" width=30
  for ((p=0; p<=100; p+=4)); do
    local filled=$((p * width / 100))
    local bar
    bar=$(printf '%*s' "$filled" '' | tr ' ' '#')
    printf "\r%-28s [%-${width}s] %3d%%" "$label" "$bar" "$p"
    sleep $((RANDOM % 2))."$((RANDOM % 2))"5
  done
  echo
}

clear
echo -e "${BOLD}"
echo "  ============================================"
echo "        OPSEC PRO INSTALLER  v9.0.1-beta"
echo "     Military-Grade Operational Security (tm)"
echo "  ============================================"
echo -e "${NC}"
sleep 1

echo -e "${YELLOW}Initializing installer...${NC}"
spinner "Checking system compatibility" 2
spinner "Contacting totally-real security servers" 3
spinner "Verifying your identity (don't move)" 2

echo
progress_bar "Downloading opsec-core.pkg"
progress_bar "Downloading paranoia-engine"
progress_bar "Downloading tinfoil-hat-module"

echo
spinner "Encrypting your thoughts" 3
spinner "Disabling your webcam (mentally)" 2
spinner "Hiding your browser history from yourself" 3
spinner "Installing VPN for your VPN" 2
spinner "Deleting evidence of last night's snacks" 2
spinner "Teaching your router to whisper" 2

echo
echo -e "${YELLOW}Scanning for threats...${NC}"
sleep 1
echo -e "${RED}[!] THREAT DETECTED: someone is reading this over your shoulder${NC}"
sleep 2
echo -e "${YELLOW}[*] Attempting to neutralize...${NC}"
spinner "Neutralizing shoulder surfer" 3

echo
echo -e "${YELLOW}Finalizing installation...${NC}"
progress_bar "Finalizing OPSEC"

echo
echo -e "${GREEN}${BOLD}[SUCCESS] OPSEC has been installed.${NC}"
sleep 1
echo -e "Your operational security level is now: ${BOLD}CLASSIFIED${NC}"
sleep 2
echo
echo -e "${CYAN}----------------------------------------------${NC}"
echo -e "${BOLD} OPSEC LEVEL AURA${NC}"
echo -e "${BOLD}  OPSEC TELEMENTARY SENT${NC}"
echo -e "${BOLD}  OPSEC INSTALLED${NC}"
echo -e "${CYAN}----------------------------------------------${NC}"
echo
