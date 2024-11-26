# ✅ Todo View

**todo-view** is a lua plugin for Neovim to open the nearest TODO.md in a
floating window and can be edited as normal.

![image](https://github.com/user-attachments/assets/378ca674-a96e-4f95-ac06-dd4fb8a2831f)

> [!NOTE]
> Not case-insensitive. Will only find `TODO.md`.

## Installation

Install the plugin with your plugin manager.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "Sheeplet1/todo-view.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
```

## Configuration

```lua
{
    window = {
        height = height,
        width = width,
        border = "rounded",
    },
}
```

## Usage

`todo-view` finds the closest `TODO.md` starting from your current working
directory.

- Toggle the TODO window

```vim
:TodoView
```
