# Sucata Lua Addon

An addon for the [sumneko lua extension](https://luals.github.io/) that provides
additional functionality and enhancements for
[Sucata engine](https://github.com/sucata-engine/sucata-engine).

## How to install

### Addon Manager Install

1. Install the [sumneko lua extension](https://luals.github.io/)
2. Open the Addon Manager
3. Search for 'sucata' and install

### Manual Install

1. Install the [sumneko lua extension](https://luals.github.io/)
2. Create a custom LuaAddons folder in any location you prefer.
3. Clone or download this repository into the LuaAddons folder.
4. Open your VSCode settings (JSON) and add the following configuration:

```json
"Lua.workspace.library": [
  "~/your-path-to/LuaAddons",
]
```

Then when you create a sucata project, you write `sucata.`, the extension will
suggest you to enable the addon.

## Sucata 2.0

Sucata 2.0 runs games on LuaJIT, so the addon sets `Lua.runtime.version` to `"LuaJIT"`. The language
server then flags Lua 5.3/5.4-only syntax such as `//`, bitwise operators and `<const>`.
