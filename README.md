# Luau Template (Rojo + Wally)

## Stack

**Toolchain:** [rokit](https://github.com/rojo-rbx/rokit), [rojo](https://rojo.space/), [wally](https://wally.run/), wally-package-types

**Task runner:** [just](https://github.com/casey/just) — `justfile` wraps the multi-step commands below into single ones (`just deps`, `just build`, ...). See `just --list`.

**Lint & Format:** [selene](https://kampfkarren.github.io/selene/), [stylua](https://github.com/JohnnyMorganz/StyLua)

**Networking:** [lync](https://wally.run/package/axp3cter/lync)

**Data:** [profile-store](https://wally.run/package/lm-loleris/profilestore)

**State:** [charm](https://wally.run/package/littensy/charm), [charm-sync](https://wally.run/package/littensy/charm-sync), [ripple](https://wally.run/package/littensy/ripple)

**UI:** [vide](https://wally.run/package/alicesaidhi/vide), [vide-ripple](https://wally.run/package/littensy/vide-ripple)

**ECS:** [jecs](https://wally.run/package/ukendio/jecs)

**Async:** [promise](https://wally.run/package/evaera/promise)

**Cleanup:** [janitor](https://wally.run/package/howmanysmall/janitor)

**Spatial Queries:** [quickzone](https://wally.run/package/ldgerrits/quickzone)

**Utils:** [sera](https://wally.run/package/enzzyfrenzzy/sera), [signal](https://wally.run/package/sleitnick/signal)

## Commands

```bash
just setup    # first time only
just update   # after editing wally.toml
just serve    # everyday, or run task
just lint
just format
just build
```

VS Code: `Ctrl+Shift+B` (or Command Palette → Run Task → `dev`) opens `rojo serve` + sourcemap watch in integrated terminal tabs at once — see `.vscode/tasks.json`.
