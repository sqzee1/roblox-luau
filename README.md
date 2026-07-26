# Luau Template (Rojo + Wally)

## Stack

**Toolchain:** [rokit](https://github.com/rojo-rbx/rokit), [rojo](https://rojo.space/), [wally](https://wally.run/), wally-package-types

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

## Setup

```bash
rokit install   # install rojo, wally, stylua, wally-package-types
wally install    # install packages
```

## Scripts

```bash
rojo serve                                                      # serve project to Roblox Studio
rojo sourcemap default.project.json --output sourcemap.json -w  # regenerate sourcemap on change
wally install                                                   # install/update Packages
wally-package-types --sourcemap sourcemap.json Packages/        # generate types for client packages
wally-package-types --sourcemap sourcemap.json ServerPackages/  # generate types for server packages
```
