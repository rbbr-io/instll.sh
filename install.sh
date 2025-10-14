#!/bin/bash

# Demo installer for instll.sh service
# This script demonstrates how install.sh works

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║            🚀 INSTLL.SH DEMO             ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════╝${NC}"
echo ""

echo -e "${GREEN}✅ Success!${NC} You just executed an install script via instll.sh"
echo ""

echo -e "${BLUE}📋 How it works:${NC}"
echo -e "   ${YELLOW}•${NC} You ran: ${PURPLE}curl -fsSL instll.sh/rbbr-io/instll.sh | bash${NC}"
echo -e "   ${YELLOW}•${NC} Service redirected to: ${PURPLE}raw.githubusercontent.com/rbbr-io/instll.sh/refs/heads/main/install.sh${NC}"
echo -e "   ${YELLOW}•${NC} Your shell executed this script automatically"
echo ""

echo -e "${BLUE}🔧 Usage examples:${NC}"
echo -e "   ${YELLOW}curl -fsSL instll.sh/username/reponame | bash${NC}          # Get install.sh"
echo -e "   ${YELLOW}curl -fsSL instll.sh/username/reponame/setup | bash${NC}    # Get setup.sh"
echo -e "   ${YELLOW}curl -fsSL instll.sh/username/reponame/deploy | bash${NC}   # Get deploy.sh"
echo ""

echo -e "${GREEN}🎉 Perfect for:${NC}"
echo -e "   ${YELLOW}•${NC} CI/CD pipelines"
echo -e "   ${YELLOW}•${NC} Quick software installation"
echo -e "   ${YELLOW}•${NC} Development environment setup"
echo -e "   ${YELLOW}•${NC} Docker container bootstrapping"
echo ""

echo -e "${PURPLE}💻 Visit: https://github.com/rbbr-io/instll.sh${NC}"
echo -e "${PURPLE}🌐 Service: https://instll.sh${NC}"
echo ""

echo -e "${GREEN}Happy scripting! 🎯${NC}"
echo ""
