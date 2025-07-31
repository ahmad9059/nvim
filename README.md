# 🖥️ Ahmad's Neovim Config (NvChad-Based)

Welcome to my personal Neovim configuration, built on top of [NvChad](https://github.com/NvChad/NvChad) for a modern, fast, and minimal Neovim setup tailored for **MERN Stack development**, **web technologies**, and general-purpose programming.

> ⚡ Designed for speed, productivity, and ease of maintenance.

---

## 📁 Features

- ⚙️ **Lazy-loaded plugin architecture** via NvChad
- 🧠 Intelligent code formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)
- 🧩 LSP support for JavaScript, TypeScript, Lua, HTML, CSS, JSON, TailwindCSS, Emmet, and more
- ✨ Auto-tagging with Treesitter
- 🔍 Telescope UI enhancements
- 🚀 Git integration with LazyGit
- 🤖 GitHub Copilot support
- 🔄 Template string auto-conversion (VS Code-like behavior)
- 🧵 Clean and minimal theme with custom icons

---

## 🛠️ Plugins Used

| Plugin                                    | Purpose                                           |
| ----------------------------------------- | ------------------------------------------------- |
| `nvim-lspconfig`                          | LSP setup for various languages                   |
| `stevearc/conform.nvim`                   | Code formatting with Prettier, Stylua, etc.       |
| `kdheepak/lazygit.nvim`                   | Git UI integration                                |
| `github/copilot.vim`                      | GitHub Copilot for AI code suggestions            |
| `axelvc/template-string.nvim`             | Auto-convert quotes to template strings           |
| `nvim-telescope/telescope-ui-select.nvim` | Replace default UI select with Telescope dropdown |
| `windwp/nvim-ts-autotag`                  | Auto-close and rename HTML/JSX tags               |
| `nvim-treesitter/nvim-treesitter`         | Syntax highlighting and parsing                   |

---

## 📦 Language Support

- JavaScript / TypeScript / React (JSX / TSX)
- HTML, CSS, JSON, YAML, Markdown
- Lua (with `vim` global fix)
- TailwindCSS
- Emmet (HTML, CSS, JS/TS React)
- Python (basic support)
- C# (basic support)

---

## 🧰 Requirements

- [Neovim v0.9+](https://neovim.io/)
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) and `npm` (for LSPs and formatters)
- [LazyGit](https://github.com/jesseduffield/lazygit) (optional but recommended)

---

## 🧪 Installation

> ⚠️ This configuration is meant to be used **with NvChad**. Don't install it directly into your default `~/.config/nvim` unless you're using NvChad as the base.

### 1. Install NvChad

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim
```

### 2. Clone This Config

```bash
git clone https://github.com/ahmad9059/nvim ~/.config/nvim
```

### 3. Run Mason to Install LSPs and Formatters

```bash
  :MasonInstallAll
```
