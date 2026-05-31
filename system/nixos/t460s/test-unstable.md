# nixos-unstable testen

## Vorgehen

```sh
# 1. Test-Branch anlegen
git checkout -b test-unstable

# 2. flake.nix anpassen
# nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
# home-manager.url = "github:nix-community/home-manager/master";

# 3. Nur bauen — System bleibt unverändert
sudo nixos-rebuild build --flake .#t460s

# 4a. Erfolg → wechseln
sudo nixos-rebuild switch --flake .#t460s

# 4b. Fehler → zurück zu master
git checkout master
git checkout system/nixos/t460s/flake.lock
```

## Rollback nach switch

```sh
# Eine Generation zurück
sudo nixos-rebuild switch --rollback

# Oder beim Booten: vorherige Generation im Bootloader wählen
```

## Bekannte Probleme

### AwesomeWM 4.3 Build Break

Seit nixpkgs-unstable Commit `64c08a7` (2026-05-23) schlägt der Awesome-Build fehl.
Ursache: `lgi`/`cairo` API-Inkompatibilität im `generate-examples` cmake-Target.

**Workaround:** nixpkgs auf letzten funktionierenden Commit pinnen:
```nix
nixpkgs.url = "github:NixOS/nixpkgs/d233902339c02a9c334e7e593de68855ad26c4cb";
```
