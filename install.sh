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
for cmd in git nvim curl rg fd luarocks convert xclip; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${RED}[!] Advertencia: $cmd no está instalado.${NC}"
        if [[ "$cmd" == "luarocks" ]]; then 
            echo -e "${BLUE}[i] Instalando Luarocks y dependencias de Magick...${NC}"
            sudo apt update && sudo apt install -y luarocks libmagickwand-dev build-essential m4
        fi
        if [[ "$cmd" == "convert" ]]; then 
            echo -e "${BLUE}[i] Instalando ImageMagick...${NC}"
            sudo apt install -y imagemagick
        fi
        if [[ "$cmd" == "rg" ]]; then 
            echo -e "${BLUE}[i] Instalando ripgrep (necesario para Obsidian)...${NC}"
            sudo apt install -y ripgrep
        fi
        if [[ "$cmd" == "xclip" ]]; then 
            echo -e "${BLUE}[i] Instalando xclip (para pegar imágenes en Obsidian)...${NC}"
            sudo apt install -y xclip
        fi
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

# 3. Clonar repositorio
echo -e "${GREEN}[✓] Instalando nuevos archivos de configuración...${NC}"

# 4. Inicializar Neovim
echo -e "\n${YELLOW}3. Sincronizando plugins de Lazy.nvim...${NC}"
nvim --headless "+Lazy! sync" +qa

echo -e "\n${GREEN}---------------------------------------------------------${NC}"
echo -e "${GREEN}  ✨ ¡TODO LISTO! Reinicia Neovim para disfrutar. ✨  ${NC}"
echo -e "${GREEN}---------------------------------------------------------${NC}"
echo -e "${BLUE}Atajos clave para empezar:${NC}"
echo -e "  ${YELLOW}<leader>n${NC}  -> Menú de Obsidian"
echo -e "  ${YELLOW}<leader>o${NC}  -> Explorador Oil"
echo -e "  ${YELLOW}<leader>r${NC}  -> Runner de Python/R"
echo -e "  ${YELLOW}<leader>o${NC}  -> Explorador Oil (Textual)"
echo -e "  ${YELLOW}<leader>ff${NC} -> Buscar Archivos"
