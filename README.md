# 🚀 Mi Configuración de Neovim (LazyVim + Python & R)

Esta configuración está diseñada para un flujo de trabajo productivo en ciencia de datos (Python, R, LaTeX) y gestión de notas (Obsidian), integrando Copilot y una interfaz moderna tipo VSCode.

---

## 🛠️ ¿Cómo Instalar? (Instalación Rápida)

Si quieres instalar esta configuración en un nuevo equipo (Ubuntu/Debian), simplemente ejecuta el script automático:

```bash
# 1. Clona el repositorio (si lo has subido a GitHub)
git clone https://github.com/tu-usuario/nvim-config.git ~/.config/nvim

# 2. Dale permisos de ejecución al script
chmod +x ~/.config/nvim/install.sh

# 3. Ejecuta el instalador mágico
./~/.config/nvim/install.sh
```

El script se encargará de hacer una **copia de seguridad** de tu configuración antigua, instalar dependencias de sistema y sincronizar todos los plugins de Lazy.nvim automáticamente.

---

## 󱓧 Obsidian & Notas (Mnemotécnico <leader>n)
Gestión completa de notas bajo el prefijo `<leader>n` (**N**otas). Estos atajos son globales y funcionan desde cualquier archivo.

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>no` | **󰍉 Open** | Abre el buscador rápido de notas (Quick Switch). |
| `<leader>nn` | **󰐕 New** | Crea una nueva nota en tu Vault. |
| `<leader>ns` | **󱎸 Search** | Busca texto dentro de todas tus notas (Grep). |
| `<leader>nd` | **󰃭 Daily** | Abre o crea la nota de hoy. |
| `<leader>nt` | **󰓹 Tags** | Busca notas filtrando por etiquetas. |
| `<leader>nb` | **󰌹 Backlinks** | Muestra qué notas enlazan a la actual. |
| `<leader>nc` | **󰄲 Checkbox** | Alterna el estado de una tarea (`[ ]` -> `[x]`). |
| `<leader>ni` | **󰏪 Insert** | Inserta una plantilla (Template). |
| `gf` | **Follow** | (Solo en Markdown) Salta a la nota vinculada. |

---

## 󰇥 Yazi (Explorador de Archivos Pro)
Explorador de archivos ultra rápido escrito en Rust. Se abre como una ventana flotante central.

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>y` | **Open Yazi** | Abre Yazi en el directorio del archivo actual. |
| `<leader>Y` | **Root Yazi** | Abre Yazi en el directorio raíz del proyecto. |

**Navegación básica en Yazi:**
*   `j`/`k`: Subir/Bajar.
*   `h`/`l`: Atrás/Abrir carpeta o archivo.
*   `<Enter>`: Abrir archivo en Neovim y cerrar Yazi.
*   `q`: Cerrar sin abrir nada.

---

## 󰚩 Runner Unificado (Python & R)
Todos los comandos de ejecución viven bajo el prefijo `<leader>r`. Detecta automáticamente entornos virtuales (`.venv`) e IPython.

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>rr` | **Run File** | Ejecuta el archivo completo (Python o R). |
| `<leader>rl` | **Run Line** | Envía la línea actual al terminal/consola. |
| `<leader>rs` | **Run Selection** | Envía la selección visual al terminal (en modo Visual). |
| `<leader>rf` | **Start/Focus** | Abre la consola interactiva (IPython o RStart). |
| `<leader>rq` | **Stop Session** | Cierra la consola o terminal actual. |
| `<leader>rtt` | **Terminal Abajo** | Abre una terminal horizontal genérica. |
| `<leader>rtf` | **Terminal Float** | Abre una terminal flotante centrada. |
| `<leader>rtv` | **Terminal Side** | Abre una terminal en el lateral derecho. |

> **Truco:** En cualquier terminal, pulsa `Esc` o `jk` para entrar en **Modo Normal** y navegar/copiar texto.

---

## 󰚩 Copilot Pro
Gestión completa de IA bajo el prefijo `<leader>ñ`.

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>ñp` | **Copilot Panel** | Abre el panel lateral con múltiples sugerencias. |
| `<leader>ñr` | **Refresh Panel** | Recarga las sugerencias del panel. |
| `<leader>ñe` | **Enable** | Activa Copilot. |
| `<leader>ñd` | **Disable** | Desactiva Copilot. |
| `Alt + l` | **Accept** | Acepta la sugerencia (Ghost Text). |
| `Alt + h` | **Dismiss** | Rechaza/Cierra la sugerencia actual. |

---

## 🔍 Otros Atajos Útiles
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader><space>` | **Find Files** | Buscador de archivos (Telescope). |
| `<leader>/` | **Grep** | Buscar texto dentro de archivos. |
| `<leader>,` | **Buffers** | Listar y cambiar entre archivos abiertos. |
| `<leader>ml` | **MdMath** | Renderiza ecuaciones LaTeX en Markdown. |

---

## 📂 Estructura del Proyecto (Documentación)

Tu configuración sigue la estructura modular de LazyVim:

### ⚙️ `lua/config/`
*   `options.lua`: Configuración básica (indentación, línea de comandos, PATH de Cargo/Snap).
*   `keymaps.lua`: Atajos de teclado globales y generales de Neovim.
*   `autocmds.lua`: Eventos automáticos (como el `ESC` en terminal).
*   `lazy.lua`: Inicialización del gestor de plugins Lazy.nvim.

### 🔌 `lua/plugins/` (Configuración de herramientas)
*   **Lenguajes:**
    *   `r.lua`: Soporte avanzado para lenguaje R.
    *   `lang_python_r.lua`: Configuración de Servidores de Lenguaje (LSP) para Python y R.
    *   `latex.lua`: Soporte para renderizado de matemáticas en Markdown.
*   **Herramientas de Trabajo:**
    *   `obsidian.lua`: Integración total con tu segundo cerebro (Obsidian).
    *   `runner.lua`: El corazón de tu configuración para ejecutar código Python/R.
    *   `yazi.lua`: Explorador de archivos ultra-rápido.
*   **Interfaz y UI:**
    *   `theme.lua` / `other_theme.lua`: Configuración de colores y apariencia.
    *   `ui-modern.lua`: Personalización de bordes redondeados y menús.
    *   `telescope.lua`: Buscador avanzado de archivos y texto.
    *   `blink.lua`: Motor de autocompletado inteligente.
    *   `copilot_config.lua`: Configuración del asistente de IA.

---

## 🎨 Personalización Visual
*   **Selección (`Visual`)**: El texto seleccionado se muestra en un **morado brillante** con letras blancas en negrita.
*   **Interfaz**: Bordes redondeados en todos los menús de autocompletado y documentación lateral tipo VSCode.
