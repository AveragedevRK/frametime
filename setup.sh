#!/bin/bash
# FrameTime — Full Setup Script
# Run this from the FrameTime project root

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}╔═══════════════════════════════════════╗${NC}"
echo -e "${BOLD}║        FrameTime — Setup              ║${NC}"
echo -e "${BOLD}╚═══════════════════════════════════════╝${NC}"
echo ""

# Check prerequisites
echo -e "${BLUE}Checking prerequisites...${NC}"
command -v node >/dev/null 2>&1 || { echo -e "${RED}✗ Node.js not found. Install from nodejs.org${NC}"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo -e "${RED}✗ npm not found${NC}"; exit 1; }
echo -e "${GREEN}✓ Node $(node -v)${NC}"

# Check for Xcode (macOS only)
if [[ "$OSTYPE" == "darwin"* ]]; then
  command -v xcodebuild >/dev/null 2>&1 && echo -e "${GREEN}✓ Xcode available${NC}" || echo -e "${YELLOW}⚠ Xcode not found — iOS build unavailable${NC}"
fi

echo ""
echo -e "${BLUE}Installing npm dependencies...${NC}"
npm install

echo ""
echo -e "${BLUE}Installing Expo CLI...${NC}"
npx expo install --fix 2>/dev/null || true

echo ""
echo -e "${GREEN}${BOLD}✓ Dependencies installed${NC}"
echo ""
echo -e "${BLUE}Available commands:${NC}"
echo ""
echo -e "  ${BOLD}npm start${NC}          — Start Expo dev server"
echo -e "  ${BOLD}npm run prebuild${NC}   — Generate native iOS/Android projects"
echo -e "  ${BOLD}npm run ios${NC}        — Build and run on iOS Simulator"
echo ""
echo -e "${YELLOW}${BOLD}Widget Setup (required for real device):${NC}"
echo ""
echo -e "  1. Run: ${BOLD}npm run prebuild:ios${NC}"
echo -e "  2. Open: ${BOLD}ios/FrameTime.xcworkspace${NC} in Xcode"
echo -e "  3. In Xcode: File → New → Target → Widget Extension"
echo -e "     • Product Name: FrameTimeWidget"
echo -e "     • Bundle ID: com.frametime.app.widget"
echo -e "     • Replace generated code with: ios/FrameTimeWidget/FrameTimeWidget.swift"
echo -e "  4. Add App Group: group.com.frametime.app to BOTH targets"
echo -e "  5. Build and run on device"
echo ""
echo -e "${BLUE}Deep Link Testing:${NC}"
echo ""
echo -e "  xcrun simctl openurl booted 'frametime://session/your-session-id'"
echo ""
echo -e "${GREEN}${BOLD}Setup complete. Run 'npm start' to begin.${NC}"
echo ""
