# Nix Store sauber halten

## Regelmäßige GC

```sh
# Alte Generationen löschen + GC
sudo nix-collect-garbage -d

# Nur GC ohne Generationen zu löschen
nix-collect-garbage
```

## GC Roots finden — warum bleibt etwas im Store?

```sh
# Alle GC Roots anzeigen
nix-store --gc --print-roots

# Roots für einen bestimmten Store-Pfad finden
nix-store --query --roots /nix/store/<hash>-paketname

# Warum ist Paket X im Store?
nix why-depends /run/current-system /nix/store/<hash>-paketname
```

## Häufige Ursachen für "hartnäckige" Pakete

| Ursache | Lösung |
|---|---|
| `result`-Symlinks von `nix build` | `rm ./result` im Projektverzeichnis |
| Alte Systemgenerationen | `sudo nix-collect-garbage -d` |
| Paket noch in Konfiguration deklariert | Aus `environment.nix` / `home.nix` entfernen, dann rebuild |
| Laufende Prozesse die Store-Pfade halten | Prozess beenden, dann GC |

## Nach einem Rebuild

```sh
# 1. Konfiguration anwenden
sudo nixos-rebuild switch --flake .#t460s

# 2. Alte Generationen + GC
sudo nix-collect-garbage -d

# 3. Prüfen
fd paketname /nix/store
```

## Speicherverbrauch analysieren

```sh
# Größte Pakete im Store
du -sh /nix/store/* | sort -rh | head -20

# Store-Gesamtgröße
du -sh /nix/store
```

## Tipp: result-Symlinks

`result`-Symlinks von alten `nix build`-Läufen sind die häufigste versteckte GC Root.
`.gitignore` Einträge anlegen:

```
result
result-*
```
