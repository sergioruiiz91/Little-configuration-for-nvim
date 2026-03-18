# 🚀 Mi Configuración de Neovim (LazyVim + Python & R)

Esta configuración está diseñada para un flujo de trabajo productivo en ciencia de datos (Python, R, LaTeX) y gestión de notas con Obsidian, integrando Copilot y una interfaz moderna tipo VSCode.

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

## 󱓧 Obsidian.nvim (Gestión de Notas)
Plugin completo para gestionar tu bóveda de Obsidian directamente desde Neovim bajo el prefijo `<leader>n`.

### Navegación y Búsqueda
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>no` | **󰍉 Open/Switch** | Cambiar rápidamente entre notas del vault. |
| `<leader>ns` | **󱎸 Search** | Buscar texto dentro de todas las notas (ripgrep). |
| `<leader>nf` | **󰌹 Follow** | Seguir el enlace bajo el cursor. |
| `<leader>nb` | **󰌹 Backlinks** | Ver qué notas enlazan a la actual. |
| `<leader>nl` | **󰌹 Links** | Listar todos los enlaces en la nota actual. |
| `gf` | **Follow Link** | (En markdown) Seguir enlace wiki/markdown. |
| `<cr>` | **Smart Action** | Seguir enlace o alternar checkbox según contexto. |

### Crear y Editar Notas
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>nn` | **󰐕 New** | Crear una nueva nota. |
| `<leader>nt` | **󰏪 Template** | Insertar una plantilla en la nota actual. |
| `<leader>nT` | **󰏪 New Template** | Crear nueva nota desde plantilla. |

### Notas Diarias (Daily Notes)
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>ndd` | **󰃭 Today** | Abrir/crear nota de hoy. |
| `<leader>ndy` | **󰃭 Yesterday** | Abrir/crear nota de ayer. |
| `<leader>ndt` | **󰃭 Tomorrow** | Abrir/crear nota de mañana. |
| `<leader>ndl` | **󰃭 List** | Listar notas diarias en picker. |

### Tags y TOC
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>ng` | **󰓹 Tags** | Buscar notas por etiquetas. |
| `<leader>nc` | **󰎚 TOC** | Ver tabla de contenidos de la nota. |

### Links en Modo Visual
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>nl` | **󰌹 Link** | Vincular texto seleccionado a nota existente. |
| `<leader>nL` | **󰌹 Link New** | Crear nueva nota y vincular texto. |
| `<leader>ne` | **󰒢 Extract** | Extraer texto seleccionado a nueva nota. |

### Utilidades
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>nx` | **󰄲 Checkbox** | Alternar estado de checkbox (`[ ]` → `[x]` → `[>]`). |
| `<leader>np` | **󰥶 Paste Image** | Pegar imagen desde portapapeles. |
| `<leader>nr` | **󰑕 Rename** | Renombrar nota y actualizar backlinks. |
| `<leader>nw` | **󰉋 Workspace** | Cambiar entre workspaces. |
| `<leader>nO` | **󰏋 Open App** | Abrir la nota en la app de Obsidian. |

> **📝 Nota:** Tu vault de Obsidian está configurado en `~/.config/obsidian`. Las plantillas van en `templates/` y las imágenes en `assets/imgs/`.

---

## 󰏪 Oil.nvim (Explorador de Archivos Textual)
Gestiona tu sistema de archivos como si fuera un buffer de texto normal bajo el prefijo `<leader>o` (**O**il).

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>oo` | **󰏪 Open** | Abre Oil en el directorio actual (buffer completo). |
| `<leader>of` | **󰏪 Float** | Abre Oil en una ventana flotante centrada. |
| `<leader>op` | **󰏪 Preview** | Alterna la ventana de previsualización (Imágenes/PDFs). |

**Navegación y Edición en Oil:**
*   **`-` (Guion)**: Sube un nivel de directorio (Carpeta padre).
*   **`H`**: Cambia el directorio de trabajo (CWD) de Neovim a la carpeta actual.
*   **`<Enter>`**: Abre el archivo o entra en la carpeta.
*   **`<Ctrl-p>`**: Previsualización rápida del archivo.
*   **`g.`**: Alterna visualización de archivos ocultos.
*   **Edición**: Puedes renombrar, borrar o crear archivos editando el texto y guardando con `:w`.

> **Nota:** Para ver imágenes y PDFs, pulsa `<leader>op` o `<Ctrl-p>` sobre el archivo. Requiere un terminal compatible (Kitty, WezTerm).

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
    *   `obsidian.lua`: Integración completa con Obsidian para gestión de notas.
    *   `runner.lua`: El corazón de tu configuración para ejecutar código Python/R.
    *   `oil_images.lua`: Explorador textual con previsualización multimedia.
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
