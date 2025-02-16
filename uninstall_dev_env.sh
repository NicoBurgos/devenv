#!/bin/bash

# Función para verificar si un comando existe
command_exists() {
    command -v "$1" &> /dev/null
}

# Verificar si el sistema es Linux
if [ "$(uname)" = "Linux" ]; then
    echo "Sistema operativo detectado: Linux"
fi

# Desinstalar herramientas instaladas con Homebrew
if command_exists brew; then
    echo "Desinstalando herramientas instaladas con Homebrew..."
    brew uninstall zsh zellij zoxide neovim node python bat fzf fastfetch atuin zsh-autosuggestions zsh-syntax-highlighting powerlevel10k eza

    # Desinstalar Homebrew si fue instalado por el script
    if [ -d "/home/linuxbrew/.linuxbrew" ]; then
        echo "Desinstalando Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    fi
else
    echo "Homebrew no está instalado. No se desinstalarán herramientas."
fi

# Restaurar la shell predeterminada a Bash (si Zsh fue configurado como predeterminado)
if command_exists chsh && [ "$(basename "$SHELL")" = "zsh" ]; then
    echo "Restaurando Bash como shell predeterminada..."
    chsh -s "$(command -v bash)"
fi

# Eliminar Oh My Zsh (si fue instalado por el script)
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Eliminando Oh My Zsh..."
    rm -rf "$HOME/.oh-my-zsh"
fi

# Eliminar Powerlevel10k (si fue instalado por el script)
if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Eliminando Powerlevel10k..."
    rm -rf "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# Eliminar configuraciones de Neovim (si fueron copiadas por el script)
if [ -d "$HOME/.config/nvim" ]; then
    echo "Eliminando configuraciones de Neovim..."
    rm -rf "$HOME/.config/nvim"
fi

# Eliminar configuraciones de Zellij (si fueron copiadas por el script)
if [ -d "$HOME/.config/zellij" ]; then
    echo "Eliminando configuraciones de Zellij..."
    rm -rf "$HOME/.config/zellij"
fi

# Eliminar configuraciones de Zsh (si fueron copiadas por el script)
if [ -d "$HOME/devenv/zsh" ]; then
    echo "Eliminando configuraciones de Zsh..."
    find "$HOME/devenv/zsh" -mindepth 1 -maxdepth 1 -exec rm -rf {} \;
fi

# Eliminar el repositorio clonado (si existe)
if [ -d "$HOME/devenv" ]; then
    echo "Eliminando el repositorio clonado..."
    rm -rf "$HOME/devenv"
fi

# Eliminar la configuración de Homebrew del .bashrc (si fue agregada por el script)
if grep -q 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' "$HOME/.bashrc"; then
    echo "Eliminando la configuración de Homebrew del .bashrc..."
    sed -i '/eval "\$(\/home\/linuxbrew\/.linuxbrew\/bin\/brew shellenv)"/d' "$HOME/.bashrc"
fi

# Mensaje final
echo "¡Desinstalación completada!"
echo "Se han eliminado todas las herramientas y configuraciones instaladas por el script."