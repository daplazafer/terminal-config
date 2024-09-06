# Makefile for macOS setup

BREW := $(shell command -v brew 2>/dev/null)
ZSH := $(shell echo $$SHELL)
FONTS_DIR := fonts
FONTS_INSTALL_DIR := ~/Library/Fonts
WARP_THEMES_DIR := warp/themes
WARP_THEMES_INSTALL_DIR := ~/.warp/themes
ZSHRC_FILE := ~/.zshrc
ZSHRC_TMP := ~/.zshrc.tmp
ZSHRC_BACKUP := ~/.zshrc.bak

all: install_brew install_zsh install_warp install_starship install_fonts install_lsd configure_starship update_zshrc copy_warp_themes set_default_shell

# Check if Homebrew is installed, if not, install it
install_brew:
ifndef BREW
	@echo "Homebrew is not installed. Installing..."
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	@echo "Homebrew is already installed."
endif

# Install Zsh using Homebrew if not already installed
install_zsh:
	@if [ "$(ZSH)" != "/bin/zsh" ]; then \
		echo "Zsh is not installed. Installing Zsh..."; \
		brew install zsh; \
	else \
		echo "Zsh is already installed."; \
	fi

# Install Warp using Homebrew Cask
install_warp:
	@echo "Installing Warp..."
	@brew install --cask warp

# Install Starship
install_starship:
	@echo "Installing Starship..."
	@brew install starship

# Install fonts from the 'fonts' directory
install_fonts:
	@echo "Installing fonts..."
	@if [ -d $(FONTS_DIR) ]; then \
		mkdir -p $(FONTS_INSTALL_DIR); \
		cp $(FONTS_DIR)/*.ttf $(FONTS_INSTALL_DIR)/; \
		echo "Fonts installed."; \
	else \
		echo "'fonts' directory not found."; \
	fi

# Copy the starship.toml configuration file to ~/.config/starship.toml
configure_starship:
	@echo "Configuring Starship..."
	@mkdir -p ~/.config
	@cp starship/starship.toml ~/.config/starship.toml

# Install LSD using Homebrew
install_lsd:
	@echo "Installing lsd..."
	@brew install lsd

# Update the zshrc configuration
update_zshrc:
	@echo "Updating zshrc..."
	@echo "Removing existing terminal configuration..."
	@cp $(ZSHRC_FILE) $(ZSHRC_BACKUP)
	@awk '/^# macOSTerminalConfig/,/^# end macOSTerminalConfig/ { next } { print }' $(ZSHRC_BACKUP) > $(ZSHRC_TMP)
	@mv $(ZSHRC_TMP) $(ZSHRC_FILE)
	@echo "Adding new terminal configuration..."
	@{ \
		echo "# macOSTerminalConfig"; \
		cat zshrc; \
		echo "# end macOSTerminalConfig"; \
	} > $(ZSHRC_TMP)
	@cat $(ZSHRC_FILE) >> $(ZSHRC_TMP)
	@mv $(ZSHRC_TMP) $(ZSHRC_FILE)

# Copy Warp themes from warp/themes to ~/.warp/themes
copy_warp_themes:
	@echo "Copying Warp themes..."
	@if [ -d $(WARP_THEMES_DIR) ]; then \
		mkdir -p $(WARP_THEMES_INSTALL_DIR); \
		cp $(WARP_THEMES_DIR)/* $(WARP_THEMES_INSTALL_DIR)/; \
		echo "Warp themes copied."; \
	else \
		echo "'warp/themes' directory not found."; \
	fi

# Set zsh as the default shell if it is not already set
set_default_shell:
	@echo "Checking if zsh is the default shell..."
	@if [ "$$(basename $$SHELL)" != "zsh" ]; then \
		echo "Setting zsh as the default shell..."; \
		chsh -s /bin/zsh; \
	else \
		echo "zsh is already the default shell."; \
	fi
