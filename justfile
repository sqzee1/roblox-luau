[windows]
set shell := ["powershell.exe", "-NoLogo", "-NoProfile", "-Command"]

default:
    @just --list

# one-time setup (new clone, or a tool version bumped in rokit.toml)
setup:
    rokit install
    wally install

# run after editing wally.toml (add/update/remove a package)
update:
    wally install
    rojo sourcemap default.project.json --output sourcemap.json
    wally-package-types --sourcemap sourcemap.json Packages/
    wally-package-types --sourcemap sourcemap.json ServerPackages/

# lint + format check, same as CI
lint:
    selene src
    stylua --check src

# apply formatting
format:
    stylua src

# package src/ into a local place file, ready to open+publish in Studio
build:
    rojo build default.project.json --output release.rbxl

# dev loop — run in two separate terminals (can't merge two watchers into one)
serve:
    rojo serve
