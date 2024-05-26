# start.sh
#!/bin/bash

# Colors for styling
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print a message with a delay
function print_with_delay {
    if [ "$FAST_MODE" = false ]; then
        echo -e "$1"
        sleep 2
    fi
}

# Fast mode flag
FAST_MODE=false

# Check for fast mode argument
if [ "$1" = "fast" ]; then
    FAST_MODE=true
fi

# Welcome message with credits
clear
print_with_delay "${CYAN}Welcome to the nvm setup script!${NC}"
print_with_delay "${CYAN}Script by Alex-724${NC}"
print_with_delay "${CYAN}Visit my GitHub: ${GREEN}github.com/Alex-724${NC}"
sleep 1

# Removing any existing nvm installation
print_with_delay "${RED}Removing any existing nvm installation...${NC}"
rm -rf ~/.nvm

# Installing nvm
print_with_delay "${CYAN}Installing nvm...${NC}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

# Cleaning up and updating .bashrc
print_with_delay "${CYAN}Cleaning up and updating ~/.bashrc to load nvm...${NC}"
sed -i '/NVM_DIR/d' ~/.bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc

# Clear screen and final message
clear
if [ "$FAST_MODE" = true ]; then
    echo -e "${GREEN}Setup complete!${NC}"
    echo "Please restart your terminal session or run 'source ~/.bashrc' to load nvm."
    echo "You can then install the latest LTS version of Node.js with 'nvm install --lts'."
    echo -e "${CYAN}Script by Alex-724${NC}"
    echo -e "${CYAN}Visit my GitHub: ${GREEN}github.com/Alex-724${NC}"
else
    print_with_delay "${GREEN}Setup complete!${NC}"
    print_with_delay "Please restart your terminal session or run 'source ~/.bashrc' to load nvm."
    print_with_delay "You can then install the latest LTS version of Node.js with 'nvm install --lts'."
    print_with_delay "${CYAN}Script by Alex-724${NC}"
    print_with_delay "${CYAN}Visit my GitHub: ${GREEN}github.com/Alex-724${NC}"
fi
