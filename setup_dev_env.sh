#!/bin/bash

# Función para verificar si un comando existe
command_exists() {
    command -v "$1" &> /dev/null
}

# Verificar si el sistema es Linux
if [ "$(uname)" = "Linux" ]; then
    echo "Sistema operativo detectado: Linux"
    # Instalar dependencias necesarias para Linux
    echo "Instalando dependencias para Linux..."
    sudo apt-get update
    sudo apt-get install -y build-essential curl file git
fi

# Instalar Homebrew (si no está instalado)
if ! command_exists brew; then
    echo "Instalando Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configurar Homebrew en el PATH
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -d /opt/homebrew && eval "$(/opt/homebrew/bin/brew shellenv)"

    # Agregar Homebrew al .bashrc del usuario actual
    echo >> "$HOME/.bashrc"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
fi

# Asegurarse de que Homebrew esté en el PATH
eval "$(brew shellenv)"

echo "Homebrew ya está instalado."

# Actualizar Homebrew
echo "Actualizando Homebrew..."
brew update

# Instalar herramientas con Homebrew
echo "Instalando herramientas con Homebrew..."
brew install zsh zellij zoxide neovim node python bat fzf fastfetch atuin zsh-autosuggestions zsh-syntax-highlighting powerlevel10k eza

# Agregar Zsh a /etc/shells si no está incluido
ZSH_PATH="$(brew --prefix)/bin/zsh"
if ! grep -Fxq "$ZSH_PATH" /etc/shells; then
    echo "Agregando Zsh instalado por Homebrew a /etc/shells..."
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi

# Configurar Zsh como shell predeterminada (si no está configurada)
if [ "$SHELL" != "$ZSH_PATH" ]; then
    echo "Configurando Zsh como shell predeterminada..."
    chsh -s "$ZSH_PATH"
else
    echo "Zsh ya es la shell predeterminada."
fi

# Instalar Oh My Zsh (si no está instalado)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Instalando Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh ya está instalado."
fi

# Configurar Powerlevel10k como tema
if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Configurando Powerlevel10k como tema..."
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
else
    echo "El tema Powerlevel10k no se encuentra instalado correctamente."
    echo "Instalando Powerlevel10k manualmente..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
fi

# Clonar el repositorio con las configuraciones personalizadas
REPO_URL="https://github.com/NicoBurgos/devenv"
REPO_DIR="$HOME/devenv"

if [ ! -d "$REPO_DIR" ]; then
    echo "Clonando el repositorio de configuraciones..."
    git clone "$REPO_URL" "$REPO_DIR"
else
    echo "El repositorio de configuraciones ya está clonado."
fi

# Copiar configuraciones de Neovim
if [ -d "$REPO_DIR/nvim" ]; then
    echo "Copiando configuraciones de Neovim..."
    mkdir -p "$HOME/.config/nvim"
    cp -r "$REPO_DIR/nvim/"* "$HOME/.config/nvim/"
else
    echo "No se encontró la carpeta de configuraciones de Neovim en el repositorio."
fi

# Copiar configuraciones de Zellij
if [ -d "$REPO_DIR/zellij" ]; then
    echo "Copiando configuraciones de Zellij..."
    mkdir -p "$HOME/.config/zellij"
    cp -r "$REPO_DIR/zellij/"* "$HOME/.config/zellij/"
else
    echo "No se encontró la carpeta de configuraciones de Zellij en el repositorio."
fi

# Copiar configuraciones de Zsh (incluyendo archivos ocultos)
if [ -d "$REPO_DIR/zsh" ]; then
    echo "Copiando configuraciones de Zsh..."
    # Usar find para copiar archivos y directorios, incluyendo los ocultos
    find "$REPO_DIR/zsh" -mindepth 1 -maxdepth 1 -exec cp -r {} "$HOME/" \;
else
    echo "No se encontró la carpeta de configuraciones de Zsh en el repositorio."
fi

# Mensaje final
echo "¡Entorno de desarrollo configurado con éxito!"
echo "Herramientas instaladas:"
echo "- Homebrew: $(brew --version)"
echo "- Zsh: $(zsh --version)"
echo "- Zellij: $(zellij --version)"
echo "- Zoxide: $(zoxide --version)"
echo "- Neovim: $(nvim --version | head -n 1)"
echo "- Node.js: $(node --version)"
echo "- npm: $(npm --version)"
echo "- Python: $(python3 --version)"
echo "- bat: $(bat --version)"
echo "- fzf: $(fzf --version)"
echo "- eza: $(eza --version)"
echo "- fastfetch: $(fastfetch --version)"
echo "- Atuin: $(atuin --version)"
echo "- Powerlevel10k: Instalado y configurado"
echo "- zsh-autosuggestions: Instalado"
echo "- zsh-syntax-highlighting: Instalado"
