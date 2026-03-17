#!/bin/bash

# 🚀 INSTALADOR AUTOMÁTICO DE CONFIGURACIÓN NVIM (LazyVim + Data Science)
# -----------------------------------------------------------------------
# Diseñado para Ubuntu/Debian. Automatiza backup, clonado y dependencias.

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}---------------------------------------------------------${NC}"
echo -e "${BLUE}  󰚩  Instalando Configuración Maestra de Neovim  󰚩  ${NC}"
echo -e "${BLUE}---------------------------------------------------------${NC}"

# 1. Comprobar dependencias básicas
echo -e "\n${YELLOW}1. Comprobando herramientas esenciales...${NC}"
for cmd in git nvim curl rg fd; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${RED}[!] Error: $cmd no está instalado.${NC}"
        if [[ "$cmd" == "rg" ]]; then echo "Instala ripgrep: sudo apt install ripgrep"; fi
        if [[ "$cmd" == "fd" ]]; then echo "Instala fd-find: sudo apt install fd-find"; fi
    else
        echo -e "${GREEN}[✓] $cmd detectado.${NC}"
    fi
done

# 2. Backup de configuración actual
echo -e "\n${YELLOW}2. Haciendo copia de seguridad...${NC}"
if [ -d "$HOME/.config/nvim" ]; then
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    echo -e "${BLUE}[i] Moviendo config actual a ~/.config/nvim_backup_$TIMESTAMP${NC}"
    mv "$HOME/.config/nvim" "$HOME/.config/nvim_backup_$TIMESTAMP"
fi

# 3. Clonar repositorio (Simulado: en tu caso es copiar la carpeta actual)
# En un repo de GitHub real, aquí iría: git clone https://github.com/tu-usuario/nvim-config.git ~/.config/nvim
echo -e "${GREEN}[✓] Instalando nuevos archivos de configuración...${NC}"
# (Este paso se asume manual o mediante git si estuviera en la nube)

# 4. Configuración de Yazi (Snap/Cargo path)
echo -e "\n${YELLOW}3. Configurando herramientas externas (Yazi/Cargo)...${NC}"
mkdir -p "$HOME/.cargo/bin"
if command -v yazi &> /dev/null; then
    echo -e "${GREEN}[✓] Yazi detectado.${NC}"
else
    echo -e "${BLUE}[i] Sugerencia: Instala yazi con 'sudo snap install yazi' o mediante Cargo.${NC}"
fi

# 5. Inicializar Neovim
echo -e "\n${YELLOW}4. Sincronizando plugins de Lazy.nvim...${NC}"
nvim --headless "+Lazy! sync" +qa

echo -e "\n${GREEN}---------------------------------------------------------${NC}"
echo -e "${GREEN}  ✨ ¡TODO LISTO! Reinicia Neovim para disfrutar. ✨  ${NC}"
echo -e "${GREEN}---------------------------------------------------------${NC}"
echo -e "${BLUE}Atajos clave para empezar:${NC}"
echo -e "  ${YELLOW}<leader>n${NC}  -> Menú de Obsidian"
echo -e "  ${YELLOW}<leader>r${NC}  -> Runner de Python/R"
echo -e "  ${YELLOW}<leader>y${NC}  -> Explorador Yazi"
echo -e "  ${YELLOW}<leader>ff${NC} -> Buscar Archivos"
