# Habilita el "instant prompt" de Powerlevel10k. Debe estar cerca de la parte superior de ~/.zshrc.
# Esto mejora la velocidad de inicio de Zsh al cargar el prompt de manera asíncrona.
# Cualquier código de inicialización que requiera entrada del usuario (por ejemplo, solicitudes de contraseña) debe ir antes de este bloque.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Si vienes de Bash, es posible que necesites ajustar tu $PATH.
# Ejemplo: Agrega directorios personalizados a $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Ruta a la instalación de Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"

# Establece el tema que se cargará. Si se establece en "random", cargará un tema aleatorio cada vez que se inicie Oh My Zsh.
# Para ver qué tema se cargó, ejecuta: echo $RANDOM_THEME
# Ver más temas en: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Lista de temas para elegir al cargar aleatoriamente.
# Si se establece esta variable cuando ZSH_THEME="random", Zsh cargará un tema de esta lista en lugar de buscar en $ZSH/themes/.
# Si se establece como una lista vacía, esta variable no tendrá efecto.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Descomenta la siguiente línea para usar completado sensible a mayúsculas/minúsculas.
# CASE_SENSITIVE="true"

# Descomenta la siguiente línea para usar completado insensible a guiones.
# El completado sensible a mayúsculas/minúsculas debe estar desactivado. _ y - serán intercambiables.
# HYPHEN_INSENSITIVE="true"

# Descomenta una de las siguientes líneas para cambiar el comportamiento de actualización automática.
# zstyle ':omz:update' mode disabled  # desactiva las actualizaciones automáticas
# zstyle ':omz:update' mode auto      # actualiza automáticamente sin preguntar
# zstyle ':omz:update' mode reminder  # solo te recuerda actualizar cuando es necesario

# Descomenta la siguiente línea para cambiar la frecuencia de actualización automática (en días).
# zstyle ':omz:update' frequency 13

# Descomenta la siguiente línea si pegar URLs y otro texto se ve mal.
# DISABLE_MAGIC_FUNCTIONS="true"

# Descomenta la siguiente línea para desactivar los colores en el comando `ls`.
# DISABLE_LS_COLORS="true"

# Descomenta la siguiente línea para desactivar la configuración automática del título de la terminal.
# DISABLE_AUTO_TITLE="true"

# Descomenta la siguiente línea para habilitar la corrección automática de comandos.
# ENABLE_CORRECTION="true"

# Descomenta la siguiente línea para mostrar puntos rojos mientras se espera la finalización de un comando.
# También puedes establecer otro texto para mostrar en lugar de los puntos rojos.
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Nota: Esta configuración puede causar problemas con prompts multilínea en Zsh < 5.7.1 (ver #5765)
# COMPLETION_WAITING_DOTS="true"

# Descomenta la siguiente línea si deseas desactivar el marcado de archivos no rastreados en VCS como "sucios".
# Esto hace que la verificación del estado del repositorio sea mucho más rápida en repositorios grandes.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Descomenta la siguiente línea si deseas cambiar el formato de la marca de tiempo en el historial de comandos.
# Puedes elegir uno de los tres formatos opcionales:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# o establecer un formato personalizado usando las especificaciones de la función strftime.
# HIST_STAMPS="mm/dd/yyyy"

# ¿Deseas usar una carpeta personalizada diferente a $ZSH/custom?
# ZSH_CUSTOM=/ruta/a/nueva/carpeta

# ¿Qué plugins deseas cargar?
# Los plugins estándar se encuentran en $ZSH/plugins/
# Los plugins personalizados pueden agregarse en $ZSH_CUSTOM/plugins/
# Ejemplo de formato: plugins=(rails git textmate ruby lighthouse)
# Agrega con cuidado, ya que demasiados plugins pueden ralentizar el inicio de Zsh.
#plugins=(
#  git
#  zsh-syntax-highlighting
#  zsh-autosuggestions
#)

# Carga Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Configuración del usuario

# export MANPATH="/usr/local/man:$MANPATH"

# Puedes necesitar establecer manualmente tu entorno de idioma.
# export LANG=es_ES.UTF-8

# Editor preferido para sesiones locales y remotas.
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Banderas de compilación
# export ARCHFLAGS="-arch $(uname -m)"

# Establece alias personales, sobrescribiendo los proporcionados por Oh My Zsh.
# Los alias pueden colocarse aquí, aunque se recomienda definirlos en un archivo en la carpeta $ZSH_CUSTOM.
# Ejemplos:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# Para ver una lista completa de alias activos, ejecuta `alias`.
#
# Ejemplo de alias
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Para personalizar el prompt, ejecuta `p10k configure` o edita ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Configura NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Carga nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Carga la completación de bash para nvm

# Agrega Homebrew al PATH
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Carga zsh-syntax-highlighting y zsh-autosuggestions
source "/home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Inicializa zoxide (navegación inteligente de directorios)
eval "$(zoxide init zsh)"

# Inicializa atuin (gestión del historial de comandos)
eval "$(atuin init zsh)"

# Inicia Zellij automáticamente al iniciar Zsh (opcional)
#if [[ -z "$ZELLIJ" && -n "$TTY" ]]; then
#  zellij attach --create
#  exit
#fi

# Alias para el comando `ls` usando `eza` (una alternativa moderna a `ls`)
alias ls="eza --color=always --long --git --no-permissions --icons=always"
