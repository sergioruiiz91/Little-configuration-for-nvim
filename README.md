# 🚀 Mi Configuración de Neovim (LazyVim + Python & R)

Esta configuración está diseñada para un flujo de trabajo productivo en ciencia de datos (Python, R, LaTeX) y gestión de notas (Obsidian), integrando Copilot y una interfaz moderna tipo VSCode.

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

> **Truco:** En la terminal, pulsa `Esc` o `jk` para entrar en **Modo Normal** y navegar/copiar texto.

---

## 󰚩 Copilot Pro
Gestión completa de IA bajo el prefijo `<leader>ñ`.

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>ñp` | **Copilot Panel** | Abre el panel lateral con múltiples sugerencias. |
| `<leader>ñr` | **Refresh Panel** | Recarga las sugerencias del panel. |
| `<leader>ñe` | **Enable** | Activa Copilot. |
| `<leader>ñd` | **Disable** | Desactiva Copilot. |
| `<leader>ñs` | **Status** | Muestra el estado de la conexión. |
| `Alt + l` | **Accept** | Acepta la sugerencia (Ghost Text). |
| `Alt + h` | **Dismiss** | Rechaza/Cierra la sugerencia actual. |

---

## 󰙏 Obsidian & Notas
Atajos específicos cuando estás dentro de una nota de Obsidian.

| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `gf` | **Follow Link** | Salta a la nota vinculada bajo el cursor. |
| `<leader>ch` | **Checkbox** | Alterna el estado de una tarea (`- [ ]` -> `- [x]`). |
| `<Enter>` | **Smart Action** | Acción inteligente (abrir link, checkbox, etc). |
| `<leader>ob` | **Backlinks** | Muestra qué notas enlazan a la actual. |
| `<leader>ot` | **Tags** | Busca notas por etiquetas. |

---

## 🔍 Diagnósticos & UI
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>xx` | **Diagnostics** | Lista de errores de todo el proyecto (Trouble). |
| `<leader>xX` | **Buffer Errors** | Lista de errores solo del archivo actual. |
| `<leader>ul` | **Toggle Lines** | Alterna entre ver errores bajo el código o a la derecha. |
| `<leader>cs` | **Symbols** | Muestra el árbol de funciones y variables del archivo. |

---

## 📊 R Específicos
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>rd` | **R Docs** | Menú de ayuda, summary, names y str de objetos. |
| `<leader>rw` | **Workspace** | Browser de objetos y visor de DataFrames. |
| `<leader>rg` | **Plot** | Envía el objeto bajo el cursor para graficarlo. |
| `<Enter>` | **Send Line** | (En modo Normal/Visual) Envía el código a R. |

---

## 📝 LaTeX & Markdown
| Atajo | Acción | Descripción |
| :--- | :--- | :--- |
| `<leader>ml` | **MdMath Build** | Renderiza ecuaciones LaTeX en Markdown/Rmd. |

---

## 🎨 Personalización
*   **Selección (`Visual`)**: El texto seleccionado se muestra en un **morado brillante** con letras blancas en negrita.
*   **Interfaz**: Bordes redondeados en todos los menús de autocompletado y documentación lateral tipo VSCode.
