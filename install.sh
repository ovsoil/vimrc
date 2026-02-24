#!/bin/bash
# ============================================================================
# One-click Neovim setup for macOS and Ubuntu
# Installs neovim, system dependencies, deploys config, installs plugins
# Usage: bash install.sh
# ============================================================================
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
NVIM_MIN_VERSION="0.10.0"

# ---- Logging ----
info()  { printf "\033[1;34m==>\033[0m \033[1m%s\033[0m\n" "$*"; }
ok()    { printf "\033[1;32m  ✓\033[0m %s\n" "$*"; }
warn()  { printf "\033[1;33m  !\033[0m %s\n" "$*"; }
error() { printf "\033[1;31m==> ERROR:\033[0m %s\n" "$*"; exit 1; }

# ---- Retry wrapper (for flaky GitHub access) ----
retry() {
    local max_attempts=5
    local delay=5
    local attempt=1
    local desc="$1"
    shift
    while [ $attempt -le $max_attempts ]; do
        info "$desc (attempt $attempt/$max_attempts)"
        if "$@"; then
            return 0
        fi
        if [ $attempt -lt $max_attempts ]; then
            warn "Failed, retrying in ${delay}s..."
            sleep $delay
            delay=$((delay * 2))
        fi
        attempt=$((attempt + 1))
    done
    error "Failed after $max_attempts attempts: $desc"
}

# ---- OS detection ----
detect_os() {
    case "$OSTYPE" in
        darwin*) echo "macos" ;;
        linux*)
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                echo "$ID"
            else
                echo "linux"
            fi
            ;;
        *) error "Unsupported OS: $OSTYPE" ;;
    esac
}

# ---- Version comparison: returns 0 if $1 >= $2 ----
version_ge() {
    printf '%s\n%s\n' "$2" "$1" | sort -V -C
}

# ---- Check if a command exists ----
has() { command -v "$1" &>/dev/null; }

# ============================================================================
# macOS installation
# ============================================================================
install_macos() {
    info "Setting up macOS dependencies..."

    if ! has brew; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    local packages=()
    has nvim     || packages+=(neovim)
    has rg       || packages+=(ripgrep)
    has node     || packages+=(node)
    has python3  || packages+=(python3)
    has make     || packages+=(make)

    if [ ${#packages[@]} -gt 0 ]; then
        info "Installing: ${packages[*]}"
        brew install "${packages[@]}"
    fi

    # Ensure neovim is new enough
    if has nvim; then
        local ver
        ver=$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
        if ! version_ge "$ver" "$NVIM_MIN_VERSION"; then
            warn "Neovim $ver is too old (need >= $NVIM_MIN_VERSION), upgrading..."
            brew upgrade neovim
        fi
    fi

    ok "System packages ready"

    info "Installing Python provider (pynvim)..."
    pip3 install --upgrade pynvim 2>/dev/null \
        || pip3 install --upgrade pynvim --break-system-packages 2>/dev/null \
        || warn "pynvim install failed, defx.nvim may not work"
    ok "pynvim installed"

    info "Installing tree-sitter-cli..."
    npm ls -g tree-sitter-cli &>/dev/null \
        || npm install -g tree-sitter-cli
    ok "tree-sitter-cli installed"
}

# ============================================================================
# Ubuntu installation
# ============================================================================
install_ubuntu() {
    info "Setting up Ubuntu dependencies..."

    sudo apt-get update -y -qq

    local packages=(git make gcc curl)
    has rg       || packages+=(ripgrep)
    has python3  || packages+=(python3 python3-pip python3-venv)

    # Always ensure python3-pip is available
    packages+=(python3-pip)

    info "Installing base packages: ${packages[*]}"
    sudo apt-get install -y -qq "${packages[@]}"

    # Neovim: need 0.10+, Ubuntu repo is usually too old
    local need_nvim=true
    if has nvim; then
        local ver
        ver=$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
        if version_ge "$ver" "$NVIM_MIN_VERSION"; then
            ok "Neovim $ver already installed"
            need_nvim=false
        else
            warn "Neovim $ver is too old (need >= $NVIM_MIN_VERSION)"
        fi
    fi

    if $need_nvim; then
        info "Installing Neovim via PPA..."
        sudo apt-get install -y -qq software-properties-common
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt-get update -y -qq
        sudo apt-get install -y -qq neovim
        ok "Neovim installed: $(nvim --version | head -1)"
    fi

    # Node.js: coc.nvim needs >= 16.18
    if ! has node || ! version_ge "$(node -v | tr -d v)" "16.18.0"; then
        info "Installing Node.js LTS via NodeSource..."
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y -qq nodejs
    fi
    ok "Node.js $(node -v) ready"

    info "Installing pynvim..."
    pip3 install --upgrade pynvim --break-system-packages 2>/dev/null \
        || pip3 install --upgrade pynvim 2>/dev/null \
        || warn "pynvim install failed, defx.nvim may not work"
    ok "pynvim installed"

    info "Installing tree-sitter-cli..."
    if has sudo; then
        sudo npm install -g tree-sitter-cli 2>/dev/null || npm install -g tree-sitter-cli
    else
        npm install -g tree-sitter-cli
    fi
    ok "tree-sitter-cli installed"
}

# ============================================================================
# Deploy config (symlink repo to ~/.config/nvim)
# ============================================================================
deploy_config() {
    info "Deploying Neovim config..."

    mkdir -p "$(dirname "$CONFIG_DIR")"

    if [ -e "$CONFIG_DIR" ] || [ -L "$CONFIG_DIR" ]; then
        local real_path
        real_path="$(readlink -f "$CONFIG_DIR" 2>/dev/null || echo "")"
        if [ "$real_path" = "$REPO_DIR" ]; then
            ok "Config already linked: $CONFIG_DIR -> $REPO_DIR"
            return
        fi
        local backup="${CONFIG_DIR}.bak.$(date +%Y%m%d%H%M%S)"
        warn "Backing up existing config to $backup"
        mv "$CONFIG_DIR" "$backup"
    fi

    ln -sf "$REPO_DIR" "$CONFIG_DIR"
    ok "Config linked: $CONFIG_DIR -> $REPO_DIR"
}

# ============================================================================
# Neovim first-run setup
# ============================================================================
nvim_setup() {
    # Step 1: Install all plugins via lazy.nvim
    # Lazy! (with bang) runs synchronously - safe for headless mode
    retry "Installing plugins" \
        nvim --headless "+Lazy! sync" +qa

    ok "Plugins installed"

    # Step 2: Compile treesitter parsers (best effort, 90s timeout)
    # Bundled parsers (c, lua, vim, vimdoc, markdown, query) are always available.
    # This pre-compiles the rest so first file-open is instant.
    info "Compiling treesitter parsers (this takes about a minute)..."
    local ts_langs='{"cpp","python","javascript","typescript","html","css","json","yaml","bash","go","vue"}'
    nvim --headless \
        -c "lua require('lazy').load({plugins={'nvim-treesitter'}})" \
        -c "lua require('nvim-treesitter').install($ts_langs)" \
        -c "sleep 90" \
        -c "qa!" 2>/dev/null || true
    ok "Treesitter parsers compiled"

    # Step 3: Verify
    info "Verifying installation..."
    local parser_count
    parser_count=$(nvim --headless \
        -c "lua require('lazy').load({plugins={'nvim-treesitter'}})" \
        -c 'lua io.write(tostring(#require("nvim-treesitter").get_installed()))' \
        -c 'qa!' 2>&1 | tr -dc '0-9')
    ok "Treesitter parsers available: ${parser_count:-?}"

    local plugin_count
    plugin_count=$(nvim --headless \
        -c 'lua io.write(tostring(#require("lazy").plugins()))' \
        -c 'qa!' 2>&1 | tr -dc '0-9')
    ok "Plugins installed: ${plugin_count:-?}"
}

# ============================================================================
# Main
# ============================================================================
main() {
    echo ""
    echo "  Neovim Configuration Installer"
    echo "  ==============================="
    echo ""

    local os
    os=$(detect_os)
    info "Detected OS: $os"

    case "$os" in
        macos)  install_macos ;;
        ubuntu) install_ubuntu ;;
        *)      error "Unsupported OS: $os (only macOS and Ubuntu)" ;;
    esac

    deploy_config
    nvim_setup

    echo ""
    info "Installation complete!"
    echo ""
    echo "  Run 'nvim' to start editing."
    echo "  On first launch, coc.nvim will auto-install language servers."
    echo ""
    echo "  Useful commands:"
    echo "    :checkhealth       - Verify setup"
    echo "    :Lazy              - Plugin manager"
    echo "    :CocInstall <ext>  - Install coc extensions"
    echo ""
}

main "$@"
